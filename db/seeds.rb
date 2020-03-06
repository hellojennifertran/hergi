# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

# users
spierce = User.create!(email: "Suzanne.pierce@gmail.co.uk", password: "sporting", first_name: "Suzanne", last_name: "Pierce")
khuang = User.create!(email: "Kye.Huang93@gmail.co.uk", password: "sporting", first_name: "Kye", last_name: "Huang")
llishi = User.create!(email: "lee-lishien@hotmail.com", password: "sporting", first_name: "Leslie ", last_name: "Lee")
arowle = User.create!(email: "A.J.Rowley@gmail.com", password: "sporting", first_name: "Alissa", last_name: "Rowley")
jspence = User.create!(email: "Jeannie.Spen@culinary.co.edu", password: "sporting", first_name: "Jean", last_name: "Spencer")
pholme = User.create!(email: "Patty.Holmes@gmail.com", password: "sporting", first_name: "Patrick", last_name: "Holmes")
regli = User.create!(email: "Reggieli@dexters.co.uk", password: "sporting", first_name: "Reggie", last_name: "Li")
zfoo = User.create!(email: "zack.foon@spqrsf.com", password: "sporting", first_name: "Zack", last_name: "Foon")
ataylo = User.create!(email: "Alexis.taylor@clovelcub.co.uk", password: "sporting", first_name: "Alexis", last_name: "Taylor")

goal = Goal.create!(
  user_id: User.last.id,
  category: '',
  category_type: '',
  note: 'This is my goal',
  )

  query = Goals::CATEGORIES[category: params[:category]
  url = "https://api.predicthq.com/v1/events/?q=#{query}"
  
  doc = open(url).read
  p doc
  
