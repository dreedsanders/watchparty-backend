class Api::V1::MovieWatchesController < ApplicationController
    before_action :logged_in?

    def index
        moviewatches = MovieWatch.all 
        render json: moviewatches
    end

    def create
        # byebug
        watch = MovieWatch.create(user_id: params[:user_id], movie_id: params[:movie_id])
        render json: watch
    end


    def destroy
        watch = MovieWatch.find(params[:id])
        watch.destroy
    end


end
