class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]
  before_action :item_set, only: [:show, :update, :edit, :destroy]
  before_action :order_checker, only: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    redirect_to action: :index unless user_signed_in? && @item.user.id == current_user.id
    if @item.order.present? 
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && @item.user.id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def order_checker
    @orders = Order.all
  end

  def item_params
    params.require(:item).permit(:image, :name, :describe, :price, :category_id, :status_id, :bearer_id, :region_id,
                                 :delivar_at_id).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end
end
