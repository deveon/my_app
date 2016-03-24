class Users::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.all
    @comment = Comment.new 
  end

  def new
  end
 
  def edit
    @user = current_user
  end

def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
