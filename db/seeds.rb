# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
User.create!([{
  email: "admin@admin.com",                                                                            
  password: "1234",
  password_confirmation: "1234",
  admin: true                                                                                           
},
{
  email: "m@k.com",
  password: "1234",
  password_confirmation: "1234"
},
{
  email: "m@g.com",
  password: "1234",
  password_confirmation: "1234"
}])



Hotel.destroy_all
hotels=[]
8.times do |index|
  hotels[index]=  Hotel.new(name: "Title #{index+1}",
                  price: "#{(index+1)*rand(1000..1200)}",
                  contact_email: "hotel#{index+1}@gmail.com",
                  location: "Place #{rand(1..4)}"
                  )
  hotels[index].image.attach(io: File.open("./app/assets/images/hotel#{index+1}.jpg"), filename: "jw-mariot.jpg", content_type: "image/jpeg")
  hotels[index].save
end


Hotel.all.each do |hotel|
  review=hotel.reviews.new(rating: (rand()*2+3).round(1), 
  comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  approved_by: 102
  )
  review.pictures.attach(io: File.open("./app/assets/images/hotel1.jpg"), filename: "jw-mariot.jpg", content_type: "image/jpeg")
  review.save
  review.usercomments.create(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
  
  hotel.reviews.create(rating: (rand()*2+3).round(1), 
  comment: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
  )
end