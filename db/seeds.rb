# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a default user
User.find_or_create_by!(email: 'user@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end

# Create a default admin user
User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin = true
end

puts "Created default user (user@example.com) and admin (admin@example.com)"

# Create categories
puts "\\n== Seeding categories =="
electronics = Category.find_or_create_by!(name: 'Elektronika', description: 'Vše od mobilů po televize.')
books = Category.find_or_create_by!(name: 'Knihy', description: 'Tištěné knihy všech žánrů.')

# Create products
puts "\\n== Seeding products =="
Product.find_or_create_by!(name: 'Chytrý telefon X1', description: 'Nejnovější model s umělou inteligencí.', price: 15000, category: electronics)
Product.find_or_create_by!(name: 'Detektivka z Prahy', description: 'Napínavý příběh od českého autora.', price: 399, category: books)
Product.find_or_create_by!(name: 'Sluchátka Zvuk Mág', description: 'Bezdrátová sluchátka s potlačením hluku.', price: 2500, category: electronics)

puts "\\n== Seeding complete =="
