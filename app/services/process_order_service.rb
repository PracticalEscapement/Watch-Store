class ProcessOrderService

  def initialize(order:)
    @order = order
  end

  def call
    ensure_stripe_customer_is_present
    add_credit_card_to_customer_account
    charge_customer
  end

  private

  def user
    @order.user
  end

  def cart
    user.shopping_cart
  end

  def default_currency
    'usd'
  end

  def order_contents
    line_item_descriptions = []
    cart.line_items.each do |line_item|
      line_item_descriptions << line_item.item.description + " x " + line_item.quantity.to_s
    end
    line_item_descriptions.join(", ")
  end

  def create_stripe_customer
    Stripe::Customer.create({
      name: user.name,
      email: user.email
    })
  end

  def stripe_customer
    Stripe::Customer.retrieve(user.stripe_customer_id)
  end

  def user_has_a_stripe_account?
    user.stripe_customer_id.present?
  end

  def ensure_stripe_customer_is_present
    customer = nil
    if user_has_a_stripe_account?
      customer = stripe_customer
    else
      customer = create_stripe_customer
      user.update!(stripe_customer_id: customer.id)
    end
    customer
  end

  def add_credit_card_to_customer_account
    return if stripe_customer.default_source.present?
    attach_token_to_customer(token: create_stripe_token)
  end

  def create_stripe_token
    Stripe::Token.create({
      card: {
        number: '4242424242424242',
        exp_month: '10',
        exp_year: '2022',
        cvc: '123',
      }
    })
  end

  def attach_token_to_customer(token:)
    Stripe::Customer.create_source(
      stripe_customer.id,
      {source: token}
    )
  end

  def charge_customer
    Stripe::Charge.create({
      customer: stripe_customer.id,
      amount: cart.total_cost_in_cents,
      currency: default_currency,
      description: order_contents,
    })
  end

end
