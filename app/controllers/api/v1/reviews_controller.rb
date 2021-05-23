class Api::V1::ReviewsController < ApplicationController
    def index
        reviews = Reviews.all 
        render json: reviews
        
    end

end
