class PaymentMethodsController < ApplicationController
  def index
    @payment_methods = PaymentMethod.all
  end
  
  def new
    @payment_method = PaymentMethod.new
  end
  
  def create
    @payment_method = PaymentMethod.new(params.require(:payment_method).permit(:title))
    if @payment_method.save
      redirect_to payment_methods_path
    else
      render :new
    end
  end
  
  def edit
    @payment_method = PaymentMethod.find(params[:id])
  end
  
  def update
    @payment_method = PaymentMethod.find(params[:id])
    if @payment_method.update(params.require(:payment_method).permit(:title))
      redirect_to payment_methods_path
    else
      render :edit
    end
  end
end
