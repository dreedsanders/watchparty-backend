class Api::V1::ReviewsController < ApplicationController
    before_action :logged_in?
    def index
        reviews = Review.all 
        render json: reviews
        
    end

    def create
        # byebug
        review = Review.create(review: params[:review], user_id: params[:user_id], movie_id: params[:movie_id])
        render json: review
    end

    

end
