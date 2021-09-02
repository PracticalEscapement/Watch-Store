ActiveAdmin.register Item do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :catagory, :condition, :price, :description, :image_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:catagory, :condition, :price, :description, :image_url]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    column :description
    column :price do |item|
      number_to_currency(item.price_in_dollars)
    end
    column :condition
    column :catagory
    column 'Image' do |item|
      image_tag(item.image_url, size: '100')
    end
    actions

  end

end
