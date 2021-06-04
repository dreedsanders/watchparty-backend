# Preview all emails at http://localhost:3000/rails/mailers/response_mailer

class ResponseMailerPreview < ActionMailer::Preview
    def new_response_email
        @response = Response.create(response: "test", user_id: 71, review_id: 380)
        ResponseMailer.with(response: @response).new_response_email
    end

    # fake response created for Prof. Natosha Kassulke id 71 and review <Review id: 380, review: "Holy Fate-worse-than-death", user_id: 71, movie_id: 351, created_at: "2021-05-25 20:06:54.805945000 +0000", updated_at: "2021-05-25 20:06:54.805945000 +0000"> for movie #<Movie id: 351, title: "The Great Dictator", description: "Rhino", year: "1999", genres: "Short story", IMDB_rating: 41, poster: "https://loremflickr.com/300/300", fanart: "https://loremflickr.com/g/300/300/all", starring: "Chōbee Akimichi", directors: "Shadowfax", likes: 12, created_at: "2021-05-25 20:06:54.617220000 +0000", updated_at: "2021-05-25 20:06:54.617220000 +0000">,

end