class ProjectArraysController < ApplicationController
  respond_to :html, :json  

  def index
    @project_array = ProjectArray.find(params[:id])
    respond_to do |format|
      format.rb { send_data @project_array.to_plugin }
    end
  end

  def new
    @project_array = ProjectArray.new
  end

  def create
    @project_array = ProjectArray.new(project_array_params)
    if @project_array.save
      redirect_to @project_array.project
    else
      render 'new'
    end
  end

  def show
    @project_array = ProjectArray.find(params[:id])
    redirect_to @project_array.project  
  end

  def update
    @project_array = ProjectArray.find(params[:id])
    @project_array.update_attributes(project_array_params)
    respond_with @project_array
  end

  def update_module
    new_params = module_update_params
    @project_array = ProjectArray.find(new_params[:id])
    @project_array.create_solar_module(module_update_params)
    redirect_to @project_array.project
  end
 
  def edit
  end

  private
  
  def project_array_params
    params.require(:project_array).permit(:name, :project_id, :sqft, :solar_module_id, :new_solar_module_brand, :new_solar_module_model, :new_solar_module_length, :new_solar_module_height, :new_solar_module_width, :new_solar_module_nominal_wattage)
  end

  def module_update_params
    params.require(:post).permit(:id, :solar_module_id, :new_solar_module_brand, :new_solar_module_model, :new_solar_module_length, :new_solar_module_height, :new_solar_module_width, :new_solar_module_nominal_wattage)
  end

end
