# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
Attendances.destroy_all

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




20.times do
  Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 1),
    content: Faker::Lorem.sentence(word_count: 10),
    user_id: User.find(rand(User.first.id..User.last.id)).id
  )
end

10.times do
  Tag.create!(
    title: Faker::Lorem.sentence(word_count: 1)
  )
end

20.times do
  JoinTableTagGossip.create!(
    gossip_id: Gossip.find(rand(Gossip.first.id..Gossip.last.id)).id,
    tag_id: Tag.find(rand(Tag.first.id..Tag.last.id)).id
  )  
end



70.times do
  Comment.create(
    content: Faker::TvShows::Simpsons.quote,
    user_id: User.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
end