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

# Взаимоотношения 
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

Category.create([ {name:	"Мясо"},          
								  {name:	"Рыба"},      
									{name:	"Овощи"},         
									{name:	"Крупа"},        
									{name:	"Закуски"},        
									{name:	"Салаты"},        
									{name:	"Завтраки"},        
									{name:	"Супы"},           
									{name:	"Вторые блюда"},   
									{name:	"Выпечка"},        
									{name:	"Десерты"},        
									{name:	"Напитки"} ])

