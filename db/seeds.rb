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

cities = ["Barcelona, Spain", "Madrid, Spain", "Paris, France", "Lyon, France", "London, England", "Manchester, England",
  "Luxembourg, Luxembourg", "Berlin, Germany", "Munich, Germany", "Canberra, Australia", "Wellington, New Zealand",
  "Lima, Peru", "Washington, United States", "New York, United States", "Lisbon, Portugal", "Oslo, Norway", "Beijing, China",
  "Tokyo, Japan", "Dijon, France", "Stockholm, Sweden", "Bratislava, Slovakia", "Buenos Aires, Argentina", "Cusco, Peru",
  "Medellin, Colombia", "Bologna, Italy", "Napoli, Italy", "Caracas, Venezuela", "Moscow, Russia", "Rekjavik, Iceland", "Helsinki, Finland",
  "Prievidza, Slovakia", "Bilbao, Spain", "Sofia, Bulgaria", "Belgrade, Serbia", "Alger, Algeria", "Cairo, Egypt", "Tunis, Tunisia", "Cape Town, South Affrica",
  "Istanbul, Turkey", "Niger, Nigeria", "Antananarivo, Madagascar", "Dakar, Senegal", "Macon, France", "Osaka, Japan", "Kyoto, Japan", "New Dehli, India", "Taipei, Taiwan",
  "Brussels, Belgium", "Valencia, Venezuela", "Valencia, Spain", "Valence, France", "Seoul, South Korea", "Hong Kong, Honk Kong", "Bangkok, Thailand", "Phnom Penh, Cambodia",
  "Cancun, Mexico", "Tulum, Mexico", "San Cristobal de las casas, Mexico", "Guadalajara, Mexico", "Mexico city, Mexico", "Antigua, Guatemala", "Guatemala city, Guatemala",
  "San Salvador, Salvador", "San Pedro Sula, Honduras", "Managua, Nicaragua", "Tijuana, Mexico", "San Jose, Costa Rica", "Panama city, Panama", "Bogota, Columbia", "Georgetown, Guyana",
  "Montevideo, Urugay", "Sao Paulo, Brazil", "Nairobi, Kenya", "Luanda, Angola", "Marseille, France", "Douala, Cameroon", "Abidjan, Ivory Coast", "Newcastle, England", "Glasgow, Wales", "Belfast, Ireland",
  "Athens, Greece", "Dubrovnik, Croatia", "Kiev, Ukraine", "Tbilisi, Georgia"]

25.times do
  Flat.create!(
    title: Faker::Address.street_name,
    address: cities.sample,
    price: Faker::Number.within(range: 100..3000),
    description: Faker::Address.community,
    user: users.sample
  )
end
