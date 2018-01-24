User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end

Business.create!(name:  "Example Business",
             city:  "Brooklyn",
             state: "NY",
             zipcode: "11243",
             address1: "900 7th Ave",
             address2: "800 6th Ave",
             phone: "7828899485",
             email: "example@railstutorial1.org",
             description: "We do Burgers and Fries")

99.times do |nn|
  name     = Faker::Name.name
  city     = "Brooklyn"
  state    = "NY"
  zipcode  = Faker::Number.zipcode
  address1 = Faker::Address.address1
  address2 = Faker::Address.address2
  phone    = Faker::PhoneNumber.phone
  email    = "example-#{nn+1}@railstutorial2.org"
  description = "Meat and cheese any bread products"
  
  Business.create!(name:  name,
                   city:  city,
                   state: state,
                   zipcode: zipcode,
                   address1:    address1,
                   address2:    address2,
                   phone:       phone,
                   email:       email,
                   description: description)
end