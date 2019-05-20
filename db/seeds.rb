puts 'Cleaning database...'
Review.destroy_all
Booking.destroy_all
Bike.destroy_all
User.destroy_all

puts 'Creating users...'
users_attributes = [
  {
    email: "dave@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    first_name: "Dave",
    last_name: "Jones",
    username: "DJ1",
    about_me: "I'm alright",
    photo: "che.jpeg"
  },
  {
    email: "Johnny@hotmail.com",
    password: "456789",
    first_name: "Johnno",
    last_name: "Squirmo",
    username: "Sandpaper",
    about_me: "I'm not from around here",
    photo: "jon.jpeg"
  },
  {
    email: "ant@yahoo.com",
    password: "789012",
    first_name: "Ant",
    last_name: "Hero",
    username: "DatGuy",
    about_me: "I'm just dat guy",
    photo: "ant.jpg"
  },
  {
    email: "fred_fr@gmail.fr",
    password: "123456",
    first_name: "Fredro",
    last_name: "Frank",
    username: "FreddyFresh",
    about_me: "I like cheese",
    photo: "fred.jpeg"
  },
  {
    email: "zapz@hotmail.co.uk",
    password: "456789",
    password_confirmation: "456789",
    first_name: "Zac",
    last_name: "Smith",
    username: "ZacAttack",
    about_me: "Did someone say vape?",
    photo: "zac.jpeg"
  }
]

puts 'Creating bikes...'
bikes_attributes = [
  {
    make: "Pinarello",
    model: "PR-2",
    color: "Red",
    bike_type: "crmance",
    description: "Fast and lightweight",
    frame_size: "Medium",
    foldable: false,
    location: "Camberwell",
    owner_id: 1,
    price: 10,
    photo: "red.jpg"
  },
  {
    make: "Eddy Merckx",
    model: "XR-23",
    color: "Green",
    bike_type: "Endurance",
    description: "Wide tires",
    frame_size: "Large",
    foldable: true,
    location: "Hoxton",
    owner_id: 2,
    price: 8,
    photo: "green.jpg"
  },
  {
    make: "BMC",
    model: "Francis",
    color: "Blue",
    bike_type: "Mountain",
    description: "Durable",
    frame_size: "Medium",
    foldable: false,
    location: "Croydon",
    owner_id: 3,
    price: 15,
    photo: "blue.jpeg"
  },
  {
    make: "Trek",
    model: "Avalanche",
    color: "White",
    bike_type: "BMX",
    description: "Very light",
    frame_size: "Small",
    foldable: false,
    location: "Hounslow",
    owner_id: 4,
    price: 19,
    photo: "white.jpg"
  },
  {
    make: "Giant",
    model: "Polstov",
    color: "Yellow",
    bike_type: "Mountain",
    description: "Heavy",
    frame_size: "Large",
    foldable: false,
    location: "Wembley",
    owner_id: 5,
    price: 5,
    photo: "yellow.jpg"
  },
  {
    make: "Focus",
    model: "Speedster",
    color: "Black",
    bike_type: "Commuter",
    description: "very small and light",
    frame_size: "small",
    foldable: true,
    location: "Enfield",
    owner_id: 5,
    price: 16,
    photo: "black.jpg"
  },
]

puts 'Creating bookings...'
bookings_attributes = [
  {
    bike_id: 1,
    start_date: "20 May 2019",
    end_date: "22 May 2019",
    rider_id: 3
  },
  {
    bike_id: 4,
    start_date: "10 Apr 2019",
    end_date: "01 May 2019",
    rider_id: 2
  },
  {
    bike_id: 5,
    start_date: "03 Mar 2019",
    end_date: "13 Mar 2019",
    rider_id: 4
  },
  {
    bike_id: 5,
    start_date: "01 Jan 2019",
    end_date: "20 Jan 2019",
    rider_id: 1
  }
]

puts 'Creating reviews...'
reviews_attributes = [
  {
    stars: 4,
    description: "Good bike",
    booking_id: 1
  },
  {
    stars: 2,
    description: "Not in great condition",
    booking_id: 3
  },
  {
    stars: 5,
    description: "Great ride, thanks.",
    booking_id: 2
  }
]

User.create!(users_attributes)
puts "Users created"
Bike.create!(bikes_attributes)
puts "Bikes created"
Booking.create!(bookings_attributes)
puts "Bookings created"
Review.create!(reviews_attributes)
puts "Reviews created"

puts 'Finished!'

