class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end
  
  def client_orders
    @client = Client.find(params[:id])
    @completed_orders = @client.completed_orders
    
    respond_to do |format|
      format.js {}
    end
  end
end
