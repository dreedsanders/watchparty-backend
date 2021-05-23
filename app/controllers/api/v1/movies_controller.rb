class Api::V1::MoviesController < ApplicationController
    before_action :logged_in?
    def index
        movies=Movie.all
        render json: movies
    end

end
