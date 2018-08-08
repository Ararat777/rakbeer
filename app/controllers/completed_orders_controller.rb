class CompletedOrdersController < ApplicationController
  before_action :set_completed_order,only: [:show,:edit,:update,:destroy]
  def index
    if params[:q]
      filter_query(params[:q])
    else
      @orders = CompletedOrder.paginate(:page => params[:page],:per_page => 25)
    end
    
  end
  
  def new
    @completed_order = current_order.build_completed_order
  end
  
  def show
    respond_to do |format|
      format.html{}
      format.pdf do
        send_file "#{Rails.root}/app/reports/Отчет_по_заказу_#{@completed_order.id}.pdf",type: 'application/pdf',disposition: :inline
      end
    end
  end
  
  def create
    
    @completed_order = current_order.build_completed_order(completed_order_params)
    
    if @completed_order.save
      session[:order_id] = nil
      redirect_to completed_order_path(@completed_order.id)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @completed_order.update(completed_order_params)
      redirect_to completed_order_path(@completed_order.id)
    else
      render :edit
    end
  end
  
  def destroy
    @completed_order.destroy
    redirect_to completed_orders_path
  end
  
  private
  
  def set_completed_order
    @completed_order = CompletedOrder.find(params[:id])
  end
  
  def completed_order_params
    params.require(:completed_order).permit(:client_phone,:client_name,:adress_delivery,:payment_method_id,:order_status_id)
  end
  
  def filter_query(query)
    query.each do |k,v|
      @orders = CompletedOrder.public_send(k,v.to_date)
    end
  end
end
