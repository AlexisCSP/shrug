User.create!(name:  "test",
             email: "test@test.com",
             password:              "1234567",
             password_confirmation: "1234567",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@test.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end