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
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532976/gun_face_180622_hpMain_4x3_992_z2imdj.jpg"
  },
  {
    email: "Johnny@hotmail.com",
    password: "456789",
    first_name: "Johnno",
    last_name: "Squirmo",
    username: "Sandpaper",
    about_me: "I'm not from around here",
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532978/pbox.php_qe0k4v.gif"
  },
  {
    email: "ant@yahoo.com",
    password: "789012",
    first_name: "Ant",
    last_name: "Hero",
    username: "DatGuy",
    about_me: "I'm just dat guy",
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532984/methode_2Ftimes_2Fprod_2Fweb_2Fbin_2Fa180333e-f0e1-11e8-8c84-29b2667b0b46_blfzcd.jpg"
  },
  {
    email: "fred_fr@gmail.fr",
    password: "123456",
    first_name: "Freda",
    last_name: "Frank",
    username: "FreddyFresh",
    about_me: "I like cheese",
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532961/demo-pic4_gl82z5.jpg"
  },
  {
    email: "zapz@hotmail.co.uk",
    password: "456789",
    password_confirmation: "456789",
    first_name: "Zac",
    last_name: "Smith",
    username: "ZacAttack",
    about_me: "Did someone say vape?",
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532962/screen-shot-2019-02-15-at-19-16-58-720x720_ohivk8.jpg"
  }
]

User.create!(users_attributes)
puts "Users created"

# array_of_ids = []
# 5.times { array_of_ids << User.all.sample.id }


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
    owner_id: User.all.sample.id,
    price: 10,
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532343/sagar-rana-193892-unsplash_w9hiko.jpg"
  },
  {
    make: "Eddy Merckx",
    model: "XR-23",
    color: "Green",
    bike_type: "Endurance",
    description: "Wide tires",
    frame_size: "Large",
    foldable: false,
    location: "Hoxton",
    owner_id: User.all.sample.id,
    price: 8,
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532423/robert-bye-200735-unsplash_b7pxmt.jpg"
  },
  {
    make: "BMC",
    model: "Francis",
    color: "Blue",
    bike_type: "Mountain",
    description: "Durable",
    frame_size: "Medium",
    foldable: true,
    location: "Croydon",
    owner_id: User.all.sample.id,
    price: 15,
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532817/folding-bike_hpqewr.jpg"
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
    owner_id: User.all.sample.id,
    price: 19,
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532604/ilya-ilford-122332-unsplash_fciwiq.jpg"
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
    owner_id: User.all.sample.id,
    price: 5,
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532580/7287272-3x2-700x467_lcoyml.jpg"
  },
  {
    make: "Focus",
    model: "Speedster",
    color: "Black",
    bike_type: "Commuter",
    description: "very small and light",
    frame_size: "small",
    foldable: false,
    location: "Enfield",
    owner_id: User.all.sample.id,
    price: 16,
    remote_photo_url: "https://res.cloudinary.com/zachobbs/image/upload/v1558532616/dallas-kwok-402163-unsplash_c89r7h.jpg"
  },
]

Bike.create!(bikes_attributes)
puts "Bikes created"

puts 'Creating bookings...'
bookings_attributes = [
  {
    bike_id: Bike.all.sample.id,
    start_date: "20 May 2019",
    end_date: "22 May 2019",
    rider_id: User.all.sample.id
  },
  {
    bike_id: Bike.all.sample.id,
    start_date: "10 Apr 2019",
    end_date: "01 May 2019",
    rider_id: User.all.sample.id
  },
  {
    bike_id: Bike.all.sample.id,
    start_date: "03 Mar 2019",
    end_date: "13 Mar 2019",
    rider_id: User.all.sample.id
  },
  {
    bike_id: Bike.all.sample.id,
    start_date: "01 Jan 2019",
    end_date: "20 Jan 2019",
    rider_id: User.all.sample.id
  }
]

Booking.create!(bookings_attributes)
puts "Bookings created"

puts 'Creating reviews...'
reviews_attributes = [
  {
    stars: 2,
    description: "Good bike",
    booking_id: Booking.all.sample.id
  },
  {
    stars: 5,
    description: "Good bike",
    booking_id: Booking.all.sample.id
  },
  {
    stars: 2,
    description: "Not in great condition",
    booking_id: Booking.all.sample.id
  },
  {
    stars: 5,
    description: "Great ride, thanks.",
    booking_id: Booking.all.sample.id
  }
]

Review.create!(reviews_attributes)
puts "Reviews created"
puts 'Finished!'

# require 'faker'


# # puts 'Cleaning database...'
# # Review.destroy_all
# # Booking.destroy_all
# Bike.destroy_all
# User.destroy_all


# puts 'Creating users...'
# users_attributes = [
#   {
#     email: "dave@gmail.com",
#     password: "123456",
#     password_confirmation: "123456",
#     first_name: "Dave",
#     last_name: "Jones",
#     username: "DJ1",
#     about_me: "I'm alright",
#     remote_photo_url: Cloudinary::Uploader.upload("./app/assets/images/che.jpg")
#   },
#   {
#     email: "Johnny@hotmail.com",
#     password: "456789",
#     first_name: "Johnno",
#     last_name: "Squirmo",
#     username: "Sandpaper",
#     about_me: "I'm not from around here",
#     remote_photo_url: Cloudinary::Uploader.upload("./app/assets/images/jon.jpg")
#   },
#   {
#     email: "ant@yahoo.com",
#     password: "789012",
#     first_name: "Ant",
#     last_name: "Hero",
#     username: "DatGuy",
#     about_me: "I'm just dat guy",
#     photo: Cloudinary::Uploader.upload("./app/assets/images/ant.jpg")
#   },
#   {
#     email: "fred_fr@gmail.fr",
#     password: "123456",
#     first_name: "Fredro",
#     last_name: "Frank",
#     username: "FreddyFresh",
#     about_me: "I like cheese",
#     photo: Cloudinary::Uploader.upload("./app/assets/images/fred.jpg")
#   },
#   {
#     email: "zapz@hotmail.co.uk",
#     password: "456789",
#     password_confirmation: "456789",
#     first_name: "Zac",
#     last_name: "Smith",
#     username: "ZacAttack",
#     about_me: "Did someone say vape?",
#     photo: Cloudinary::Uploader.upload("./app/assets/images/zac.jpg")
#   }
# ]

# User.create!(users_attributes)
# puts "Users created"

# # db/seeds.rb

# makes = ['Giant', 'Rally', 'Trek', 'BMC', 'Specialized', 'Raleigh', 'GT']
# models = ['PX-5', 'F7.3FX', 'GF-01', 'MM-230', 'ZR-150Y', 'GR-1020L', '10.252']
# bike_types = ['Mountain Bike', 'BMX', 'Road', 'Commuter', 'Hybrid', 'Penny Farthing']
# descriptions = ['Fast and lightweight', 'robust framed bike', 'fast bike', 'heavy frame', 'downhill specialist', 'great suspension', 'a basket on the front for you']
# frame_sizes = ['Small', 'Medium', 'Large']
# foldable = [true, false]
# bike_photos = ['red']

# puts 'Creating 30 fake bikes...'
# 5.times do
#   bike = Bike.create!(
#     make: makes.sample,
#     model: models.sample,
#     color: Faker::Color.color_name,
#     bike_type: bike_types.sample,
#     description: descriptions.sample,
#     frame_size: frame_sizes.sample,
#     foldable: foldable.sample,
#     location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
#     owner_id: 1,
#     price: rand(10),
#     photo: Cloudinary::Uploader.upload("/app/assets/images/zac.jpg")
#   )
# end
# puts 'Finished!'
