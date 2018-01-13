class CartsController < ApplicationController

  def show
    
  end

  def checkout
    current_cart.line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
    old_cart_id = current_cart.id
    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(id: old_cart_id)
  end

end
