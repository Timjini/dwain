# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create 10 users with random names and emails and password = password

   # seed.rb

# seed.rb

# Create 20 users
20.times do |n|
    User.create!(
      email: Faker::Internet.email,
      password: "password",
      password_confirmation: "password",
      dob: Faker::Date.birthday(min_age: 18, max_age: 65),
      phone: Faker::PhoneNumber.phone_number,
      username: Faker::Internet.username,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      height: Faker::Number.between(from: 150, to: 200),
      weight: Faker::Number.between(from: 50, to: 100)
    )
  end

10.times do |n|
  Coach.create!(
    email: Faker::Internet.email,
    password: "password",
    created_at: Time.now,
    updated_at: Time.now,
    dob: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::PhoneNumber.phone_number,
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    height: Faker::Number.between(from: 150, to: 200),
    weight: Faker::Number.between(from: 50, to: 100),
    coach_type: nil,
    is_admin: false,
    is_active: false
  )
end

# 10.times do |n|
#   Team.create!(
#     name: Faker::Team.name,
#     coach_id: Faker::Number.between(from: 1, to: 10)
#   )

# end

# 10.times do |n|
#   TeamMembership.create!(
#     user_id: Faker::Number.between(from: 1, to: 10),
#     team_id: Faker::Number.between(from: 1, to: 10)
#   )
# end
  