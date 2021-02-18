class UsersController < ApplicationController
  before_action :user_set, only:[:show, :update]

  def show
    @user = User.find(params[:id])
    if current_user.card.present?
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     card = Card.find_by(user_id: current_user.id)
     customer = Payjp::Customer.retrieve(card.customer_token)
     @card = customer.cards.first
    end
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
