class SolarModulesController < ApplicationController
  respond_to :html, :json  

  def new
    @module = Module.new
  end

  def create
    @module = Module.new(module_params)
    if @module.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @module = Module.find(params[:id])
  end

  def update
    @module = Module.find(params[:id])
    @module.update_attributes(module_params)
    respond_with @module
  end
 
  def edit
  end

  private
  
  def module_params
    params.permit(:brand, :model, :length, :width, :height, :nominal_wattage)
  end

end
