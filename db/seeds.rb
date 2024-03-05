# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Clearing database"
Gig.destroy_all
User.destroy_all

puts "Creating users"
users = []
users << User.create!(first_name: "Monte", last_name: "Legend", email: "monte@giggroove.com", password: "password")
users << User.create!(first_name: "Pabs", last_name: "King", email: "pabs@giggroove.com", password: "password")
users << User.create!(first_name: "Kingsley", last_name: "Prince", email: "kingsey@giggroove.com", password: "password")
users << User.create!(first_name: "Chris", last_name: "Jester", email: "chris@giggroove.com", password: "password")

puts "#{User.count} users created"

puts "Creating gigs"
15.times do
  gig = Gig.new(
    name: Faker::Company.name,
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    category: "#{Faker::Job.title.downcase}",
    description: Faker::Lorem.paragraph.truncate(50),
    user_id: users.sample.id
  )
  gig.save!
end
puts "#{Gig.count} gigs created"
