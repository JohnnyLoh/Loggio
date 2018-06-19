# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding started"
puts "Seed team Militär"
Team.create(name: "militär", position: 0, description: "Jgb NÖ - Miliz", photo: "")
Team.create(name: "lacrosse", position: 0, description: "Austrian Lacrosse National Team", photo: "")

puts "Seeds users"
users = []

users << User.create(first_name: "Alexander", last_name:"Thurn", username: "Sunny", password: 123456, admin: false,  email: "sunny@hotmail.com", handy_nr: 06601234567)
users << User.create(first_name: "Georg", last_name:"Mautner-Markhof", username: "Gurli", password: 123456, admin: false,  email: "gurli@hotmail.com", handy_nr: 06601234567)
users << User.create(first_name: "Alfred", last_name:"Wolff", username: "Alf", password: 123456, admin: false,  email: "alf@hotmail.com", handy_nr: 06601234567)
users << User.create(first_name: "Johannes", last_name:"Lohner", username: "Lohnny", password: 123456, admin: true,  email: "johnny@lohgio.com", handy_nr: 06601234567)

users << User.create(first_name: "Rin", last_name:"Tacho", username: "Rinti", password: 123456, admin: false,  email: "rinti@hotmail.com", handy_nr: 06601234567)
users << User.create(first_name: "Adrian", last_name:"Balasch", username: "Adrian", password: 123456, admin: false,  email: "adrian@hotmail.com", handy_nr: 06601234567)
users << User.create(first_name: "Stefano", last_name:"Stadlinger", username: "Stefano", password: 123456, admin: false,  email: "stefano@hotmail.com", handy_nr: 06601234567)
users << User.create(first_name: "Klaus", last_name:"Hauer", username: "Klaus", password: 123456, admin: false,  email: "klaus@hotmail.com", handy_nr: 06601234567)
users << User.create(first_name: "Maximilian", last_name:"Salzbrunn", username: "Maxi", password: 123456, admin: false,  email: "maxi@hotmail.com", handy_nr: 06601234567)

# puts "Assign Team and Users"

# # OwnedTeam.create(team_id: 1, user_id: 4)
# # OwnedTeam.create(team_id: 2, user_id: 4)

# AssignedTeam.create(team_id: 1, user_id: 1)
# AssignedTeam.create(team_id: 1, user_id: 2)
# AssignedTeam.create(team_id: 1, user_id: 3)
# AssignedTeam.create(team_id: 1, user_id: 4)

# AssignedTeam.create(team_id: 2, user_id: 5)
# AssignedTeam.create(team_id: 2, user_id: 6)
# AssignedTeam.create(team_id: 2, user_id: 7)
# AssignedTeam.create(team_id: 2, user_id: 8)
# AssignedTeam.create(team_id: 2, user_id: 9)
# AssignedTeam.create(team_id: 2, user_id: 4)

puts "Assign User to Team"

Team.all[0].users << User.all[0]
Team.all[0].users << User.all[1]
Team.all[0].users << User.all[2]
Team.all[0].users << User.all[3]

Team.all[1].users << User.all[4]
Team.all[1].users << User.all[5]
Team.all[1].users << User.all[6]
Team.all[1].users << User.all[7]
Team.all[1].users << User.all[8]
Team.all[1].users << User.all[3]

puts "SEED FINISHED"
