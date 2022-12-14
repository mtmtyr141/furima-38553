class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit, :update, :destroy]
  before_action :set_limits, only: [:edit, :update]
  

  
  def index 
    @items = Item.includes(:user).order("created_at DESC")
  end
  
  def new
    @item = Item.new 
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
 
 
  def edit
    unless current_user.id == @item.user_id 
      redirect_to root_path
    end
  end

  def update
      if @item.update(item_params)
         redirect_to item_path
      else
        render :edit
      end
  end

  def destroy
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
    @item.destroy
    redirect_to root_path
  end
  


  private
  

  def item_params
    params.require(:item).permit(:image, :name, :price, :detail, :state_id, :area_id, :category_id, :day_id, :burden_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_limits
    unless @item.order == nil
      redirect_to root_path
    end
  end

end
