ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    column :user
    column :line_items do |order| 
      order.line_items.collect { |line_item| "#{line_item.item.description} x#{line_item.quantity}" }.join('</br>').html_safe
    end
    column :total_cost do |order|
      number_to_currency(order.total_cost)
    end
    column :created_at
  end
  
end
