class Review < ApplicationRecord
    belongs_to :movie 
    belongs_to :user 
    has_many :responses


    def self.most_popular
        # which review got the most responses
    end

    def critic
        # user with the most reviews
    end
end




