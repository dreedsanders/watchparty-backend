class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :movies, through: :reviews
    has_many :movie_watches
    has_many :responses 
    has_many :watchmovies, through: :movie_watches, source: :movie
    validates :name, uniqueness: true


    def count_reviews
        self.reviews.count
    end

    def count_responses
        self.responses.count
    end

    def gold_member
        # do they have more than 15 reviews
        count = 15
        self.reviews.count > count
    end

    def bestie
        # which user have they RESPONDED to most?
        # need all users review_ids of responses in an array
        reviews_responded = []
         # need all reviews to find ACTUAL reviews matching list of ids
        reviews = Review.all
        # need all users to find through matched reviews
        users = User.all

        # finding all review ids
        self.responses.each do |response|
            reviews_responded << response.review_id 
        end
        
    end

    def binge_mvp
    # user with longest watchlist
    end

end

