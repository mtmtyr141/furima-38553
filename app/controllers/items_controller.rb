class ItemsController < ApplicationController
  
  def index  
  end

  def new
  end

  
  def create
    @item = Item.new(item_params)       
  end


end
