User.create!(name:  "test",
             email: "test@test.com",
             password:              "1234567",
             password_confirmation: "1234567")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end