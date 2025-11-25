# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# db/seeds.rb
# db/seeds.rb
# 1. Clean the database 🗑️
puts "Cleaning database..."
Message.destroy_all
Chat.destroy_all
Problem.destroy_all
User.destroy_all

#2. Create the users 🏗️
 puts "Creating users..."
 User.create!(email: "test@test.com", password: "123456")
 User.create!(email: "test1@test.com", password: "123456")
 puts "Created 2"
 User.create!(email: "test2@test.com", password: "123456")
 puts "Created 3"
 User.create!(email: "test3@test.com", password: "123456")


puts "Finished! Created users."
puts "Creating problems..."
 all_users = User.all
 all_users.each do |user|
   Problem.create!(user: user, title: "headaches", content: "hdhddjd")
   puts "Created 1"
   Problem.create!(user: user, title: "my partner", content: "hdfshudevwjd")
   puts "Created 2"
 end
puts "create #{all_users.count} users, each with 2 problems"
puts "created too manz problems"

all_problems = Problem.all
all_problems.each do |problem|
 Chat.create!(problem: problem, user: problem.user)
end
