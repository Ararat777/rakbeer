class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  protect_from_forgery with: :exception
  helper_method :current_order
  
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
  
end
