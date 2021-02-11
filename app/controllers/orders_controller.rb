class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_params
    params.permit(:post_num,:region_id,:cwtv,:address,:building,:phone_num).merge(user_id: current_user.id,item_id: @item.id)
  end

end
