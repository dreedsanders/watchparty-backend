class Movie < ApplicationRecord
    has_many :reviews
    has_many :movie_watches
    has_many :users, through: :reviews
    has_many :responses, through: :reviews
end
