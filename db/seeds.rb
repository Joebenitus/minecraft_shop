# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Games::Minecraft.item,
                cost: rand(1.0..100.0).round(2),
                country_of_origin: Faker::Address.country)
  5.times do |review|
    Review.create!(author: Faker::FunnyName.name,
                  content_body: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: 4).chop,
                  rating: rand(1..5),
                  product_id: product.id.to_i)
  end
end

p "Created #{Product.count} products"