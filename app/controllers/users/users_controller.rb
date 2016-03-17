class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end


def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
