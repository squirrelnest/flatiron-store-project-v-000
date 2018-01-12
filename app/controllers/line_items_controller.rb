class LineItemsController < ApplicationController

  def create
    unless current_cart
      current_user.current_cart = Cart.create(
        user_id: current_user.id,
        status: 'submitted'
      )
      current_user.save
    end
    #binding.pry
    line_item = LineItem.find_by(
      item_id: params[:item_id],
      cart_id: current_cart.id
    )
    if line_item
      line_item.quantity += 1
      line_item.save
    else
      line_item = LineItem.create(line_item_params)
    end
    redirect_to cart_path(current_cart)
  end

  private

  def line_item_params
    {cart_id: current_cart.id, item_id: params[:item_id], quantity: 1}
  end

end
