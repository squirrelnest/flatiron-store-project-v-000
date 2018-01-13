class StoreController < ApplicationController

  def index
    @current_cart = @cart
    @categories = Category.all
    @items = Item.all
  end

  def show
    @current_cart = @cart
  end

end
