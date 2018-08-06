class OrdersController < ApplicationController
  def new
    @products = Product.all
    @order_item = current_order.order_items.new
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    session[:order_id] = nil
    redirect_to new_order_path
  end
end
