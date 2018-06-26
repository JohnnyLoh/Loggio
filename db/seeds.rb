# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "STARTING SEED"

puts "Creating teams ... "

Team.create(name: "militär", position: 0, description: "Jgb NÖ - Miliz", photo: "")
Team.create(name: "lacrosse", position: 0, description: "Austrian Lacrosse National Team", photo: "")

puts "Creating users ... "

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

puts "Assigning Users to Team ... "

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

puts "Creating Columns ... "

columns = []
columns << Column.create(name: "Books", description: "Favourt books ever read", shared: false, user_id: 4)
columns << Column.create(name: "Sport", description: "Fitness", shared: true, user_id: 4)
columns << Column.create(name: "Special training", description: "extra training courses", shared: true, user_id: 4)
columns << Column.create(name: "Training dates", description: "training dates", shared: true, user_id: 4)

puts "Assign Team to Columns ... "

columns[0].teams << Team.all[0,1]
columns[1].teams << Team.all
columns[2].teams << Team.where(name: "militär")
columns[3].teams << Team.where(name: "lacrosse")

puts "Create Cards ... "

cards = []
cards << Card.create(name: "Säulen der Erde", description: "Ken Follet", user_id: 4, column_id: 1)
cards << Card.create(name: "Sternstunden der Menschheit", description: "Stefan Zweig",user_id: 4, column_id: 1)
cards << Card.create(name: "Liegestütz", description: "100", user_id: 4, column_id: 2)
cards << Card.create(name: "Push-ups", description: "7", user_id: 4, column_id: 2)
cards << Card.create(name: "P80", description: "Pistole 80 Schiessen", user_id: 4, column_id: 3)
cards << Card.create(name: "CRC", description: "Crowd and Riot control", user_id: 4, column_id: 3)
cards << Card.create(name: "Gebirgsjäger", description: "Wattener Lizum", user_id: 4, column_id: 3)
cards << Card.create(name: "Luftlandeuntersützung", description: "Black Hawk, Auguster Bell fliegen", user_id: 4, column_id: 3)
cards << Card.create(name: "Dienstag Training", description: "19:30-21:30 im Hellas Kagran", user_id: 6, column_id: 4)

puts "SEED FINISHED"
