# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Booking.destroy_all
Property.destroy_all
User.destroy_all

user1 = User.create(email: 'test@mail.com', password: '123123')
user2 = User.create(email: 'test2@mail.com', password: '123456')
cities = ['Paris', 'Brussels', 'Podgorica', 'Rome', 'Madrid', 'Amsterdam']



puts 'Creating 10 fake flats...'
10.times do
  flat = Property.new(
    name: Faker::TvShows::BigBangTheory.character,
    address: cities.sample,
    price:  rand(300..1000),
    user: User.all.sample,
    description: Faker::TvShows::BigBangTheory.quote
  )
  flat.save!
end
puts 'Finished!'
