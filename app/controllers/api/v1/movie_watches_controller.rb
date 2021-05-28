class Api::V1::MovieWatchesController < ApplicationController
    before_action :logged_in?

    def index
        moviewatches = MovieWatch.all 
        render json: moviewatches
    end

    def create
        # byebug
        users=User.all
        movie=Movie.all
        watches=MovieWatch.all
        watch = MovieWatch.find_or_create_by(user_id: params[:user_id], movie_id: params[:movie_id])
        if watch.save 
        render json: watch
        else
            render json:{error: "Already in your Watchlist!"}
        end
    end


    def destroy
        watch = MovieWatch.find(params[:id])
        watch.destroy
    end


end
