# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'georgescu.cristi@gmail.com', password: 'Parola12345', password_confirmation: 'Parola12345', first_name: "Cristian", last_name: "Georgescu", bio: "ESPCOP admin")