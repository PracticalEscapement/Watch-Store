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

  def item
    @order.item
  end

  def default_currency
    'usd'
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
      amount: item.price,
      currency: default_currency,
      description: item.description,
    })
  end

end
