class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
       @order_address.save
       redirect_to root_path
    else
       render :index
    end
  end


  def order_params
    params.require(:order_address).permit(:postal, :area_id, :city, :block, :building, :number, :order).merge(user_id: current_user.id, item_id: params[:item_id])
  end


  def set_item
    @item = Item.find(params[:item_id])
  end
 
end