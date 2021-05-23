class Api::V1::UsersController < ApplicationController
    wrap_parameters :user, include: [:name, :password, :password_confirmation]
 
   def index
       users=User.all
       render json: users
   end
  
   def show
       user=User.find_by(params[:id])
   end
 
 
   def create
       # byebug
     @user = User.new(user_params)
      if @user.save
       render json: @user, status: :created
     else
       render json: {error: "Name taken, please choose another username"}
     end
   end
 
   private
 
   def user_params
       params.require(:user).permit(:name, :password, :password_confirmation)
   end

end
