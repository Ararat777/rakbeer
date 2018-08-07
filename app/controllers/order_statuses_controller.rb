class OrderStatusesController < ApplicationController
  
  def index
    @order_statuses = OrderStatus.all
  end
  
  def new
    @order_status = OrderStatus.new
  end
  
  def create
    @order_status = OrderStatus.new(params.require(:order_status).permit(:title))
    if @order_status.save
      redirect_to order_statuses_path
    else
      render :new
    end
  end
  
  def edit
    @order_status = OrderStatus.find(params[:id])
  end
  
  def update
    @order_status = OrderStatus.find(params[:id])
    if @order_status.update(params.require(:order_status).permit(:title))
      redirect_to order_statuses_path
    else
      render :edit
    end
  end

end
