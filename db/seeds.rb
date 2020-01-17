# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Deleting all data ❌'

User.delete_all
Record.delete_all

puts 'Seeding users data'
puts 'Seeding records data'


# users_arr = []
# 10.times do
#   user = User.create(
#     username: Faker::Name.unique.first_name,
#     password: '123'
#   )
#   users_arr.push(user)
# end
  
  
  
user1 = User.create(username: Faker::Name.unique.first_name, password: '123')
user2 = User.create(username: Faker::Name.unique.first_name, password: '123')
user3 = User.create(username: Faker::Name.unique.first_name, password: '123')
user4 = User.create(username: Faker::Name.unique.first_name, password: '123')
user5 = User.create(username: Faker::Name.unique.first_name, password: '123')

groups = ['notes', 'ideas', 'stories', 'great man quotes']
users = [user1, user2, user3, user4, user5]

100.times do
  Record.create(
    group: groups.sample(),
    title: Faker::Hipster.word,
    body: Faker::Hipster.paragraph_by_chars(characters: rand(50..1000), supplemental: false),
    confidence: rand(50..100),
    user: users.sample()
  )
end

puts 'Done 👌'