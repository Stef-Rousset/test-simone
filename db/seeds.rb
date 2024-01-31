# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'deleting potato prices'

PotatoPrice.destroy_all

puts 'creating potato prices'

24.times do |i|
  PotatoPrice.create!(price_at: DateTime.new(2024, 1, 31, i, 30), amount: i + 0.15)
  PotatoPrice.create!(price_at: DateTime.new(2024, 2, 1, i, 30), amount: i + 0.25)
end

puts 'potato prices created'
