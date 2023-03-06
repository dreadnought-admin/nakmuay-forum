require 'faker'

# puts "Generating categories..."

# puts "Categories created!"

# puts "Creating users..."

# puts "Users created!"

# puts "Sampling posts..."

# puts "Posts sampled!"

# puts "Sampling some watches..."

# puts "Watches created!"

# puts "Adding in some likes..."

# puts "Likes added!"

10.times do
    User.create!(username: Faker::Internet.username, bio: nil, password: Faker::Internet.password, 
    email: Faker::Internet.email)
end 
