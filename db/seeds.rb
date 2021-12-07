User.create!(name: "Sasha Meuw", 
			 email: "sasha@example.com",
			 password: "foobar",
			 password_confirmation: "foobar",
			 avatar: File.open(Rails.root.join('app', 'assets', 'images', 'kisa.jpg')),
			 admin: true)

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

users = User.order(:created_at).take(6) 
50.times do
	title = Faker::Lorem.sentence(word_count: 1)
	content = Faker::Lorem.sentence(word_count: 30)	
	users.each { |user| user.posts.create!(title: title, content: content) } #и создай для каждого польозвателя посты по 50 штук
end