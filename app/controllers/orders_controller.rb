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
      #pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_params
    params.require(:order_address).permit(:post_num,:region_id,:cwtv,:addresses,:building,:phone_num).merge(user_id: current_user.id,item_id: @item.id)#,token: params[:token])
  end
  
  #def pay_item
  #  Payjp.api_key = "sk_test_13d89c9f6203313d69cba5e2"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #   Payjp::Charge.create(
  #      amount: Item.find(params[:item_id]).price,
  #      card: order_params[:token],
  #      currency: 'jpy'             
  #    )
  #end

end
