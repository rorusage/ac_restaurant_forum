# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Category

Category.destroy_all

category_list = [
  { name: "中式料理"},
  { name: "日本料理"},
  { name: "義大利料理"},
  { name: "墨西哥料理"},
  { name: "素食料理"},
  { name: "美式料理"},
  { name: "複合式料理"}
]

category_list.each do |category|
  Category.create( name: category[:name])
end
puts "Category created!"

# Default admin

User.create(name: "root", email: "root@example.com", password: "12345678", role: "admin")
puts "Default admin created!"
