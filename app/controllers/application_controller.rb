class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  helper_method :current_cart
  helper_method :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_cart
    current_user.current_cart
  end

end
