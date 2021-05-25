class Api::V1::ResponsesController < ApplicationController
    before_action :logged_in?
    def index
        responses = Response.all 
        render json: responses
    end

    def create
        # byebug
        response = Response.create(response: params[:response], user_id: params[:user_id], review_id: params[:review_id])
        if response.save
            ResponseMailer.with(response: response).new_response_email.deliver_later
        end
        render json: response
    end


end
