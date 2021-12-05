User.create!(name: "Sasha Meuw", 
			 email: "sasha@example.com",
			 password: "foobar",
			 password_confirmation: "foobar",
			 avatar: File.open(Rails.root.join('app', 'assets', 'images', 'kisa.jpg')))

User.create!(name: "Lilya Mur", 
			 email: "lilya@example.com",
			 password: "123123",
			 password_confirmation: "123123",
			 avatar: File.open(Rails.root.join('app', 'assets', 'images', 'cat.jpg')))

User.create!(name: "Masha UwU", 
			 email: "masha@example.com",
			 password: "123456",
			 password_confirmation: "123456",
			 avatar: File.open(Rails.root.join('app', 'assets', 'images', 'kot.jpg')))

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@exemple.org"
  password = "password"
  User.create!(name: name,
			   email: email,
			   password: password,
			   password_confirmation: password)
end