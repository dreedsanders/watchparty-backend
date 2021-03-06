class Api::V1::UsersController < ApplicationController
  # before_action :logged_in?
    wrap_parameters :user, include: [:name, :password, :password_confirmation, :profile_picture, :email]
 
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

   def update
    # byebug
    user=User.find(params[:id])
    user.update(user_params)
    render json: user
    end

    def destroy
       user=User.find(params[:id])
       user.destroy
    end

 
   private
 
   def user_params
       params.require(:user).permit(:name, :password, :password_confirmation, :profile_picture, :email)
   end

end
