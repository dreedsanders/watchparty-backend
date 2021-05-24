class User < ApplicationRecord
    has_secure_password
    has_many :reviews 
    has_many :movies, through: :reviews
    has_many :movie_watches
    has_many :responses 
    has_many :watchmovies, through: :movie_watches, source: :movie
    validates :name, uniqueness: true
end
