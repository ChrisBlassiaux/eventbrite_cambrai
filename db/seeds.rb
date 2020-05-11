# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
#Event.destroy_all
#Attendances.destroy_all

i = 0
10.times do
  User.create!(
    email: "email#{i}@yopmail.com",
    encrypted_password: "password",
    description: Faker::Lorem.sentence(word_count: 10),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  i += 1
end