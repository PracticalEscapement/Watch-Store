# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

items = Item.create([{catagory: 'watch', condition: 'new', price: 1000000, description: 'Rolex', image_url: 'https://watchesbysjx.com/wp-content/uploads/2016/03/Rolex-Datejust-41-3.jpg'},
        {catagory: 'watch', condition: 'new', price: 50000000, description: 'Patek Philippe', image_url: 'https://www.vendome.mc/wp-content/uploads/2020/04/5711_1R_001-front.jpg'}, 
        {catagory: 'jewelry', condition: 'used', price: 300000, description: 'Pear Shape Ring', image_url: 'https://media.tiffany.com/is/image/Tiffany/EcomItemL2/pear-shaped-diamond-engagement-ring-in-platinum-33716443_996131_ED_M.jpg?&op_usm=1.75,1.0,6.0&$cropN=0.1,0.1,0.8,0.8&defaultImage=NoImageAvailableInternal&'},
    ])
items.each do |item|
    "#{item.description}, ID: #{item.id}"
end

users = User.create([{first_name: 'mike', last_name: 'moradi', email: 'mike@dev.com', password: '123456'}, 
        {first_name: 'james', last_name: 'jason', email: 'james@dev.com', password: '123456'}
    ])

users.each do |user|
    "#{user.first_name} ID: #{user.id}"
end
