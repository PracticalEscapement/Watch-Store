# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item = Item.create({catagory: 'watch', condition: 'new', price: 10000, description: 'Rolex', image_url: 'https://watchesbysjx.com/wp-content/uploads/2016/03/Rolex-Datejust-41-3.jpg'})