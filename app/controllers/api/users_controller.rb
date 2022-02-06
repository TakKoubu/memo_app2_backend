module Api
  class UsersController < ApplicationController
    def index
      render json: User.all
    end

    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        render json: user
      else
        render json: user.errors, status: 422
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end
