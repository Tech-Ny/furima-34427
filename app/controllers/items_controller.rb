class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params) 

    if@item.save
      redirect_to root_path
    else
      render :new
    end

  end

  private
    def item_params
      params.require(:item).permit(:image,:name,:describe,:price,:category_id,:status_id,:bearer_id,:region_id,:delivar_at_id).merge(user_id: current_user.id)
    end


end
