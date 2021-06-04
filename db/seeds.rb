# require 'uri'
# require 'net/http'
# require 'openssl'

# url = URI("http://hackdd.co.uk/random/images")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-key"] = '02e66b9f2fmshc40c9abe86ec5dep1cf267jsn78b29265385e'
# request["x-rapidapi-host"] = 'movies-tvshows-data-imdb.p.rapidapi.com'

# response = http.request(request)
# puts response.read_body
# m1=Movie.create(title: response.read_body.split(":")[1].split(",")[0], description: response.read_body.split(":")[2], year: response.read_body.split(":")[3].split(",")[0], IMDB_rating: response.read_body.split(":")[6].split(",")[0])


User.destroy_all 
Movie.destroy_all
Review.destroy_all
Response.destroy_all
MovieWatch.destroy_all
Chat.destroy_all
Like.destroy_all



5.times do
    name = Faker::Name.unique.name
    password = "123"
    email = Faker::Internet.email
    User.create(name: name, password: password, profile_picture: "https://robohash.org/#{rand(20)}", email: email)
end
u1=User.create(name: "Test", password: "123", profile_picture: "https://lumiere-a.akamaihd.net/v1/images/open-uri20150422-20810-10n7ovy_9b42e613.jpeg?region=0,0,450,450", email: "dreedsanders@gmail.com")
u2=User.create(name:"Test2", password: "123", profile_picture: "https://lumiere-a.akamaihd.net/v1/images/open-uri20150422-20810-10n7ovy_9b42e613.jpeg?region=0,0,450,450", email: "dreedsanders@gmail.com")
users = User.all

50.times do
    title = Faker::Movie.title
    description = Faker::Superhero.descriptor 
    year = "1999"
    rating =rand(1..50)
    poster = Faker::LoremFlickr.image
    genres = Faker::Book.genre
    fanart = Faker::LoremFlickr.grayscale_image
    starring = Faker::JapaneseMedia::Naruto.character
    directors = Faker::Movies::LordOfTheRings.character
    Movie.create(title: title, description: description, year: year, IMDB_rating: rating, poster: poster, genres: genres, fanart: fanart, starring: starring, directors: directors)
end
movies= Movie.all


50.times do
    review = Faker::Quote.robin
    user_id = users[rand(1-5)].id
    movie_id = movies[rand(1-49)].id
    Review.create(review: review, user_id: user_id, movie_id: movie_id)
end

# r1=Review.create(review: "man this movie sucked", user_id: u1.id, movie_id: m1.id)
# r2=Review.create(review: "man cked", user_id: u1.id, movie_id: m1.id)
reviews = Review.all

50.times do
    response = Faker::Games::StreetFighter.quote
    user_id = users[rand(1-5)].id
    review_id = reviews[rand(1-49)].id
    Response.create(response: response, user_id: user_id, review_id: review_id)
end

# re1=Response.create(response: "haha i loved it", review_id: r1.id, user_id:u2.id)
# re2=Response.create(response: "haha i loved it", review_id: r1.id, user_id:u2.id)
# re3=Response.create(response: "haha i loved it", review_id: r1.id, user_id:u2.id)
# re4=Response.create(response: "haha i loved it", review_id: r2.id, user_id:u2.id)
# re5=Response.create(response: "haha i loved it", review_id: r2.id, user_id:u2.id)
responses=Response.all

80.times do
    user_id = users[rand(1-5)].id
    movie_id = movies[rand(1-49)].id
    MovieWatch.create(user_id: user_id, movie_id: movie_id)
end
mw1=MovieWatch.create(user_id: u1.id, movie_id:  movies[rand(1-49)].id)
# mw2=MovieWatch.create(user_id: u1.id, movie_id: m1.id)
# mw3=MovieWatch.create(user_id: u2.id, movie_id: m1.id)
watches=MovieWatch.all

b1=Basket.create(user_id: u1.id)