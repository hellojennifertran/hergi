# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

p "destroying users"
Goal.destroy_all
Post.destroy_all
User.destroy_all

# users
spierce = User.create!(email: "Suzanne.pierce@gmail.co.uk", password: "sporting", first_name: "Suzanne", last_name: "Pierce", exploration_goal: 4, health_goal: 3, relationships_goal: 5, note: "Fabulous ends in “us” coincidence? I think not")
khuang = User.create!(email: "Kye.Huang93@gmail.co.uk", password: "sporting", first_name: "Kye", last_name: "Huang", exploration_goal: 3, health_goal: 5, relationships_goal: 2, note: "A man of mystery and power, whose power is exceeded only by his mystery")
llishi = User.create!(email: "lee-lishien@hotmail.com", password: "sporting", first_name: "Leslie ", last_name: "Lee", exploration_goal: 1, health_goal: 4, relationships_goal: 3, note: "I am an actor and a writer and I co-created my breakfast and my son, Malachai.")
arowle = User.create!(email: "A.J.Rowley@gmail.com", password: "sporting", first_name: "Alissa", last_name: "Rowley", exploration_goal: 2, health_goal: 2, relationships_goal: 3, note: "I’m actually not funny. I’m just really mean and people think I am joking.")
jspence = User.create!(email: "Jeannie.Spen@culinary.co.edu", password: "sporting", first_name: "Jean", last_name: "Spencer", exploration_goal: 4, health_goal: 1, relationships_goal: 2, note: "Insert pretentious stuff about myself here.Recommended by 4 out of 5 people that recommend things")
pholme = User.create!(email: "Patty.Holmes@gmail.com", password: "sporting", first_name: "Patrick", last_name: "Holmes", exploration_goal: 3, health_goal: 1, relationships_goal: 5, note: "You see that blue follow button? I’d tap that!")
regli = User.create!(email: "Reggieli@dexters.co.uk", password: "sporting", first_name: "Reggie", last_name: "Li", exploration_goal: 3, health_goal: 4, relationships_goal: 5, note: "Why look up at the stars when the biggest star is me")
zfoo = User.create!(email: "zack.foon@spqrsf.com", password: "sporting", first_name: "Zack", last_name: "Foon", exploration_goal: 4, health_goal: 3, relationships_goal: 4, note: "You are kind, you are smart, you are important")
ataylo = User.create!(email: "Alexis.taylor@clovelcub.co.uk", password: "sporting", first_name: "Alexis", last_name: "Taylor", exploration_goal: 2, health_goal: 2, relationships_goal: 5, note: "I prefer my puns intended")

sp_post1 = Post.create(user_id: spierce.id, title: "High School Reunion", date: Date.new(2020, 2, 1), content: "It was really good to see everyone and how they've all changed from high school.")
sp_post2= Post.create(user_id: spierce.id, title: "Common Misconceptions of Touch Rugby", date: Date.new(2020, 2, 2), content: "People typically think of rugby as a very violent and full contact sport, myself included.  But Cerian convinced me otherwise, and I decided to try it for the first time myself today.  I'm glad to say I've survived the battle, a little bruised but at the same time understand the rush that comes along with the game!")
sp_post3 = Post.create(user_id: spierce.id, title: "How I've changed after using Hergi", date: Date.new(2020, 3, 5), content: "This is a little insight into my life after using Hergi for a month. I've changed for the better and everyone should try using it too.")

sp_goal1 = Goal.create(user_id: spierce.id, date: Date.new(2020, 2, 1), category: "Relationship", category_type: "Friends", private: false, note: "5th year high school reunion!")
sp_goal2 = Goal.create(user_id: spierce.id, date: Date.new(2020, 2, 2), category: "Exploration", category_type: "Rugby", private: false, note: "Cerian bruised me up during touch rugby")
sp_goal3 = Goal.create(user_id: spierce.id, date: Date.new(2020, 2, 14), category: "Health", category_type: "Sports", private: false, note: "Got to v4 today")
sp_goal4 = Goal.create(user_id: spierce.id, date: Date.new(2019, 11, 19), category: "Health", category_type: "Family", private: false, note: "Friendsgiving")

kh_post1 = Post.create(user_id: khuang.id, title: "New Year's Party", date: Date.new(2019, 1, 1), content: "After 15 years, I've finally managed to get myself in Times Square for the New Year's celebration and it was the best thing ever")
kh_post2 = Post.create(user_id: khuang.id, title: "New Diet", date: Date.new(2019, 1, 13), content: "I've had my first bite of veggies today. I'm 32 years old")
kh_goal1 = Goal.create(user_id: khuang.id, date: Date.new(2020, 2, 14), category: "Relationship", category_type: "Date", private: false, note: "I got catfished...")

ar_goal1 = Goal.create(user_id: arowle.id, date: Date.new(2019, 12, 13), category: "Relationship", category_type: "Friends", private: false, note: "Went hiking in Lake District.")
ar_goal2 = Goal.create(user_id: arowle.id, date: Date.new(2019, 12, 30), category: "Relationship", category_type: "Family", private: false, note: "Went to Thailand for Gabe's wedding")
ar_goal3 = Goal.create(user_id: arowle.id, date: Date.new(2019, 12, 13), category: "Health", category_type: "Friends", private: false, note: "Only had a kitkat all day, that counts...")

js_post1 = Post.create(user_id: jspence.id, title: "WTF is hiking", date: Date.new(2020, 2, 5), content: "I drank too much and then didn’t sleep well because camping. So I spent the whole time hung over and sleep-deprived. This is every time I go camping, btw")
js_post2 = Post.create(user_id: jspence.id, title: "WTF is hiking - continued", date: Date.new(2020, 2, 10), content: "When I was in college, I took a class my senior year called “Camping and Outdoor Education”. This was a winter course and the final was a night of camping in December…in Missouri. It’s the one and only time I’ve been camping.")

ph_post1 = Post.create(user_id: pholme.id, title: "The Elephant Rope (Belief)", date: Date.new(2020, 2, 10), content: "No matter how much the world tries to hold you back, always continue with the belief that what you want to achieve is possible. Believing you can become successful is the most important step in actually achieving it.")
ph_post2 = Post.create(user_id: pholme.id, title: "Thinking Out of the Box", date: Date.new(2020, 1, 10), content: "It’s always possible to overcome a tough situation throughout of the box thinking, and not give in to the only options you think you have to pick from.")

rl_post1 = Post.create(user_id: regli.id, title: "The Group of Frogs", date: Date.new(2019, 12, 10), content: "People’s words can have a big effect on other’s lives. Think about what you say before it comes out of your mouth. It might just be the difference between life and death.")

zf_post1 = Post.create(user_id: zfoo.id, title: "A Pound of Butter", date: Date.new(2020, 1, 30), content: "In life, you get what you give. Don’t try and cheat others.")

at_post1 = Post.create(user_id: ataylo.id, title: "Control Your Temper", date: Date.new(2020, 1, 19), content: "Control your anger, and don’t say things to people in the heat of the moment, that you may later regret. Some things in life, you are unable to take back.")
at_post2 = Post.create(user_id: ataylo.id, title: "Box Full of Kisses", date: Date.new(2020, 2, 1), content: "Some time ago, a man punished his 3-year-old daughter for wasting a roll of gold wrapping paper. Money was tight and he became infuriated when the child tried to decorate a box to put under the Christmas tree. \n
Nevertheless, the little girl brought the gift to her father the next morning and said, “This is for you, Daddy.” \n
The man became embarrassed by his overreaction earlier, but his rage continue when he saw that the box was empty. He yelled at her; “Don’t you know, when you give someone a present, there is supposed to be something inside?” \n
The little girl looked up at him with tears in her eyes and cried; \n 
'Oh, Daddy, it's not empty at all. I blew kisses into the box for you!'")
