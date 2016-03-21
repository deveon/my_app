class Users::UsersController < ApplicationController

  def show
    @user = current_user
  end

  def new
  end


def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
