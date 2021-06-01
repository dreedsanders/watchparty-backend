class Api::V1::ChatsController < ApplicationController
    # before_action :logged_in?
    def index 
        chats=Chat.all 
        render json: chats
    end

    def create
        chat = Chat.create(chat: params[:chat], user_id: params[:user_id])
        render json: chat
    end


end
