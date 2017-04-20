20.times do |n|
  name = "User-#{n+1}"
  email = "user-#{n+1}@members-only.org"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
