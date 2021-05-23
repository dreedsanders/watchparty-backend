require 'uri'
require 'net/http'
require 'openssl'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all 
Movie.destroy_all
Review.destroy_all
Response.destroy_all
MovieWatch.destroy_all


url = URI("https://movies-tvshows-data-imdb.p.rapidapi.com/?type=get-movie-details&imdb=tt2935510")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = '02e66b9f2fmshc40c9abe86ec5dep1cf267jsn78b29265385e'
request["x-rapidapi-host"] = 'movies-tvshows-data-imdb.p.rapidapi.com'

response = http.request(request)
puts response.read_body.split(":")



u1=User.create(name: "Test", password: "123")
u2=User.create(name:"Test2", password: "123")
m1=Movie.create(title: response.read_body.split(":")[1].split(",")[0], description: response.read_body.split(":")[2], year: response.read_body.split(":")[3].split(",")[0], IMDB_rating: response.read_body.split(":")[6].split(",")[0])
r1=Review.create(review: "man this movie sucked", user_id: u1.id, movie_id: m1.id)
r2=Review.create(review: "man cked", user_id: u1.id, movie_id: m1.id)
re1=Response.create(response: "haha i loved it", review_id: r1.id, user_id:u2.id)
re2=Response.create(response: "haha i loved it", review_id: r1.id, user_id:u2.id)
re3=Response.create(response: "haha i loved it", review_id: r1.id, user_id:u2.id)
re4=Response.create(response: "haha i loved it", review_id: r2.id, user_id:u2.id)
re5=Response.create(response: "haha i loved it", review_id: r2.id, user_id:u2.id)
mw1=MovieWatch.create(user_id: u1.id, movie_id: m1.id)
mw2=MovieWatch.create(user_id: u1.id, movie_id: m1.id)
mw3=MovieWatch.create(user_id: u2.id, movie_id: m1.id)