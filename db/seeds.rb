
20.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end
users = User.all

100.times do
  Wiki.create!(
    title: Faker::Superhero.name,
    body: Faker::ChuckNorris.fact
  )
end
wikis = Wiki.all

admin = User.create!(
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

member = User.create!(
   email:    'member@example.com',
   password: 'helloworld'
 )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
