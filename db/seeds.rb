# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Agency.create(name: 'disney land', phone: '123-000-0000')
Agency.create(name: 'universal studio', phone: '123-000-0001')
Agency.create(name: 'ocean park', phone: '123-000-0002')

hash = {}
hash['password'] = 'qwerty123'
hash['password_confirmation'] = 'qwerty123'
hash['email'] = 'batman@superhero.com'
user = User.create!(hash)
Tourist.create { |js| js.create_profile(user_id: user.id) }
hash['email'] = 'spiderman@superhero.com'
user = User.create!(hash)
Tourist.create { |js| js.create_profile(user_id: user.id) }
hash['email'] = 'thor@superhero.com'
user = User.create!(hash)
Tourist.create { |js| js.create_profile(user_id: user.id) }

hash['email'] = 'mickey@disney.com'
user = User.create!(hash)
TourGuide.created_with(user.id)
Translator.created_with(user.id)

hash['email'] = 'donald@disney.com'
user = User.create!(hash)
TourGuide.created_with(user.id)

