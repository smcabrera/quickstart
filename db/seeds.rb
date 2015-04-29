require 'faker'

#I'm the admin
me = User.new(
  :name     => "Stephen", # One's own name is easier to remember
  :email    => "stephen.m.cabrera@gmail.com", # One's own email is easier to remember
  :password => "password", # Easy to remember password
)

me.skip_confirmation! # Necessary becuase we're using the devise confirmable module
me.save

5.times do
  user = User.new(
    :name => Faker::Name.name,
    :email => Faker::Internet.email,
    :password => Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end

puts "Seed finished"
puts "#{User.all.count} users created"



