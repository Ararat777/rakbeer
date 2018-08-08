class OrderItemsController < ApplicationController
  
  def create
    @order = current_order
    @order_item = @order.order_items.find_or_initialize_by(:product_id => order_item_params[:product_id])
    if @order_item.new_record?
      @order_item.quantity = order_item_params[:quantity]
    else
      @order_item.update(:quantity => @order_item.quantity + order_item_params[:quantity].to_f)
    end
    @order.save
    session[:order_id] = @order.id
    
    respond_to do |format|
      format.js 
    end
  end
  
  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    respond_to do |format|
      format.js
    end
  end
  
  private
  
  def order_item_params
    params.require(:order_item).permit(:quantity,:product_id,:weight)
  end
end
