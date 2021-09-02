ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :is_admin
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :line_items do |user| 
      user.shopping_cart.line_items.collect { |line_item| "#{line_item.item.description} x#{line_item.quantity}" }.join('</br>').html_safe
    end
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
