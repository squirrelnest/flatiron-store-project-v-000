class LineItemsController < ApplicationController

  def create
    unless @cart
      @cart = Cart.create(user_id: current_user.id)
      # current_user.current_cart = @cart
      # current_user.current_cart.status = "submitted"
      @cart.status = "submitted"
    end
    @line_item = LineItem.create(line_item_params)
    @line_item.save
    redirect_to cart_path(current_cart)
  end

  private

  def line_item_params
    {cart_id: @cart.id, item_id: params[:item_id], quantity: 1}
  end

end
