# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding started"
puts "Seed team Militär"
Militär = Team.create(name: "militär", position: 0, description: "Jgb NÖ - Miliz", photo: "")
puts "SEED FINISHED"
