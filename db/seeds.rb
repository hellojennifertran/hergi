# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

user = User.create!(
  first_name: 'Jennifer',
  last_name: 'Tran',
  email: 'jennifert4@gmail.com',
  password: 'jjjjjj'
  )
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
  
