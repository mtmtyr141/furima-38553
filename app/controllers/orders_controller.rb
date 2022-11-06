class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :set_limits, only: [:index, :create]




  def index
    @order_address = OrderAddress.new
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
    params.require(:order_address).permit(:postal, :area_id, :city, :block, :building, :phonenumber, :order).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_limits
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    unless @item.order == nil
      redirect_to root_path
    end
  end
 
end
