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

puts "Generating users..."

4.times do
    User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
end 