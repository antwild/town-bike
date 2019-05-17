puts 'Cleaning database...'
Users.destroy_all

puts 'Creating users...'
users_attributes = [
  {
    email: "dave@gmail.com",
    password: "123",
    first_name: "Dave",
    last_name: "Jones",
    username: "DJ1",
    about_me: "I'm alright"
  },
  {
    email: "Johnny@hotmail.com",
    password: "456",
    first_name: "Johnno",
    last_name: "Squirmo",
    username: "Sandpaper",
    about_me: "I'm not from around here"
  },
  {
    email: "ant@yahoo.com",
    password: "789",
    first_name: "Ant",
    last_name: "Hero",
    username: "DatGuy",
    about_me: "I'm just dat guy"
  },
  {
    email: "fred_fr@gmail.fr",
    password: "123",
    first_name: "Fredro",
    last_name: "Frank",
    username: "FreddyFresh",
    about_me: "I like cheese"
  },
  {
    email: "zapz@hotmail.co.uk",
    password: "456",
    first_name: "Zac",
    last_name: "Smith",
    username: "ZacAttack",
    about_me: "Did someone say vape?"
  }
]

puts 'Creating bikes...'
bikes_attributes = [
  {
    make: "Pinarello",
    model: "PR-2",
    color: "Red",
    type: "Performance",
    description: "Fast and lightweight"
    frame_size: "Medium",
    foldable: false,
    location: "Camberwell",
    owner_id: 1,
  },
  {
    make: "Eddy Merckx",
    model: "XR-23",
    color: "Green",
    type: "Endurance",
    description: "Wide tires"
    frame_size: "Large",
    foldable: true,
    location: "Hoxton",
    owner_id: 2,
  },
  {
    make: "BMC",
    model: "Francis",
    color: "Blue",
    type: "Mountain",
    description: "Durable"
    frame_size: "Medium",
    foldable: false,
    location: "Croydon",
    owner_id: 3,
  },
  {
    make: "Trek",
    model: "Avalanche",
    color: "White",
    type: "BMX",
    description: "Very light"
    frame_size: "Small",
    foldable: false,
    location: "Hounslow",
    owner_id: 4,
  },
  {
    make: "Giant",
    model: "Polstov",
    color: "Yellow",
    type: "Mountain",
    description: "Heavy"
    frame_size: "Large",
    foldable: false,
    location: "Wembley",
    owner_id: 5,
  },
  {
    make: "Focus",
    model: "Speedster",
    color: "Black",
    type: "Commuter",
    description: "very small and light"
    frame_size: "small",
    foldable: true,
    location: "Enfield",
    owner_id: 5,
  },
]

User.create!(users_attributes)
Bike.create!(bikes_attributes)
puts 'Finished!'
