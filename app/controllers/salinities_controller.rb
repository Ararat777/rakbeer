class SalinitiesController < ApplicationController
  def index
    @salinities = Salinity.all
  end
  
  def new
    @salinity = Salinity.new
  end
  
  def create
    @salinity = Salinity.new(params.require(:salinity).permit(:title))
    if @salinity.save
      redirect_to salinities_path
    else
      render :new
    end
  end
  
  def edit
    @salinity = Salinity.find(params[:id])
  end
  
  def update
    @salinity = Salinity.find(params[:id])
    if @salinity.update(params.require(:salinity).permit(:title))
      redirect_to salinities_path
    else
      render :edit
    end
  end
end
