# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Example:
# #
# #   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
# #     MovieGenre.find_or_create_by!(name: genre_name)
# #   end



# require 'faker'

# puts "Clearing database"
Gig.destroy_all
User.destroy_all

puts "Creating users"
users = []
users << User.create!(first_name: "Monte", last_name: "L.", email: "monte@giggroove.com", password: "password", profile_picture: "https://images.pexels.com/photos/20355450/pexels-photo-20355450.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
users << User.create!(first_name: "Pabs", last_name: "K.", email: "pabs@giggroove.com", password: "password", profile_picture: "https://avatars.githubusercontent.com/u/114606058?v=4")
users << User.create!(first_name: "Kingsley", last_name: "O.", email: "kingsley@giggroove.com", password: "password", profile_picture: "https://avatars.githubusercontent.com/u/157271602?v=4")
users << User.create!(first_name: "Chris", last_name: "J.", email: "chris@giggroove.com", password: "password", profile_picture: "https://scontent-cpt1-1.xx.fbcdn.net/v/t1.6435-9/120751313_1270328433316715_66184305138610648_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=5f2048&_nc_ohc=AtLAQD31VfAAX-9kaCJ&_nc_ht=scontent-cpt1-1.xx&oh=00_AfBRujrjT-_wzOanP5VlDGqgwf0YZVliQPW7wOTtT14zeQ&oe=661097EE")

puts "#{User.count} users created"

# puts "Creating gigs"
#   15.times do
#    gig = Gig.new(
#      name: Faker::Company.name,
#      location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#      category: "#{Faker::Job.title.downcase}",
#      description: Faker::Lorem.paragraph.truncate(50),
#      user_id: users.sample.id
#    )
#    gig.save!
#  end
#  puts "#{Gig.count} gigs created"
