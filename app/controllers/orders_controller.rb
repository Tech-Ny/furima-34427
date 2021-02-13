class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :show, :create]
  before_action :item_check, only:[:index, :create]

  def index
    @order_address = OrderAddress.new

    if user_signed_in? && @item.user.id == current_user.id
      redirect_to root_path
     elsif @item.order.present?
      redirect_to root_path
    end

  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_params
    params.require(:order_address).permit(:post_num,:region_id,:cwtv,:addresses,:building,:phone_num).merge(user_id: current_user.id,item_id: @item.id,token: params[:token])
  end

  def item_check
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
     Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: order_params[:token],
        currency: 'jpy'             
      )
  end

end
