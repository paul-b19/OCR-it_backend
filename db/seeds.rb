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

groups = ['notes', 'ideas', 'stories', 'great man quotes']

users_arr = []
10.times do
  user = User.create(
    username: Faker::Name.unique.first_name,
    password: '123'
  )
  users_arr.push(user)
end

100.times do
  Record.create(
    group: groups.sample(),
    title: Faker::Hipster.word,
    body: Faker::Hipster.paragraph_by_chars(characters: rand(50..1000), supplemental: false),
    confidence: rand(50..100),
    user: users_arr.sample()
  )
end

puts 'Done 👌'