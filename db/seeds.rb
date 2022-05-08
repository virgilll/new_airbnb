# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Flat.destroy_all

users = []
5.times do
  users << User.create!(
    email: Faker::Internet.email,
    password: Faker::Blockchain::Ethereum.address,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

cities = ["Miami Beach", "Coral Gables", "Brickell"]

15.times do
  Flat.create!(
    title: Faker::Address.street_name,
    address: cities.sample,
    price: Faker::Number.within(range: 100..3000),
    description: Faker::Address.community,
    user: users.sample
  )
end
