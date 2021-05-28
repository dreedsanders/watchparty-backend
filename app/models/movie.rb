class Movie < ApplicationRecord
    has_many :reviews
    has_many :movie_watches
    has_many :users, through: :reviews
    has_many :responses, through: :reviews


    def fan_fav
        # which movie has most movie_watches
    end


    def fav_movie
        #Movie with most reviews
    end
end
