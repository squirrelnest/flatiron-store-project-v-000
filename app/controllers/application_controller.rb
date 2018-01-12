class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :current_cart
  helper_method :current_cart
  helper_method :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_cart
    if current_user.current_cart_id
      @cart = Cart.find_by(id: current_user.current_cart_id)
    else
      @cart = Cart.find_by(id: current_user.cart_ids.last)
    end
    @cart
  end

end
