class Api::V1::MoviesController < ApplicationController
    before_action :logged_in?
    def index
        movies=Movie.all
        render json: movies
    end

    def update
        # byebug
        movie = Movie.find(params[:id])
        movie.update(title: params[:title], description: params[:description],year: params[:year],genres: params[:genres],IMDB_rating: params[:IMDB_rating],poster: params[:poster],fanart: params[:fanart], starring: params[:starring], directors: params[:directors], likes: params[:likes])
        render json: movie
    end

    def fan_fav
        favorite = Movie.fan_fav
        render json: favorite
    end

    def most_talked_about
        mostreviewed = Movie.most_talked_about
        render json: mostreviewed 
    end

    def most_watched 
        mostwatched = Movie.most_watched
        render json: mostwatched
    end 




end
