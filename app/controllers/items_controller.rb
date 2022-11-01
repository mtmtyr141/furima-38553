class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  

  
  def index 
    @item = Item.all
  end
  
  def new
    @item = Item.new       
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  def item_params
    params.require(:item).permit(:image, :name, :price, :detail, :state_id, :area_id, :category_id, :day_id, :burden_id).merge(user_id: current_user.id)
  end




end

