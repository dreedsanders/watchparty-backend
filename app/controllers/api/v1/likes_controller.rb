class Api::V1::LikesController < ApplicationController
        def index
        likes = Like.all 
        render json: likes
    end

    def create
        # byebug
        users=User.all
        movie=Movie.all
        likes=Like.all
        like = Like.find_or_create_by(user_id: params[:user_id], movie_id: params[:movie_id])
        if like.save 
        render json: like
        else
            render json:{error: "Already liked!"}
        end
    end


    def destroy
        like = Like.find(params[:id])
        like.destroy
    end

end
