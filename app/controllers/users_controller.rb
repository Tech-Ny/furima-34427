class UsersController < ApplicationController
  before_action :user_set, only:[:show, :update]

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      redirect_to "show" 
    end

  end

  private 

  def user_params
    params.require(:user).permit(:nickname, :email, :password,:password_confirmation,
      :firstname, :lastname, :firstnamedetail,:lastnamedetail, :birthday)
  end

  def user_set
    @user = User.find(params[:id])
  end

end
