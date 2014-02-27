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
    @project_array.update_attributes(project_array_params)
    @project_array.create_solar_module(module_update_params)
    redirect_to @project_array.project
  end
 
  def update_measurements
    new_params = params["post"]
    @project_array = ProjectArray.find(new_params[:id])
    @project_array.length = @project_array.convert_meter_to_feet(new_params[:length])
    @project_array.width = @project_array.convert_meter_to_feet(new_params[:width])
    @project_array.save
    redirect_to edit_modules_path(@project_array)
  end
  
  def edit
    @project_array = ProjectArray.find(params[:id])
    gon.latitude = @project_array.project.latitude
    gon.longitude = @project_array.project.longitude
  end

  def edit_modules
    @project_array = ProjectArray.find(params[:id])
  end

  private
  
  def project_array_params
    params.permit(:name, :project_id, :sqft, :solar_module_id, :length, :width, :panel_spacing_side, :panel_spacing_back, :tilt_degrees, :horizontal, :kw_predicted, :kw_goal, :panel_count_predicted, :new_solar_module_brand, :new_solar_module_model, :new_solar_module_length, :new_solar_module_height, :new_solar_module_width, :new_solar_module_nominal_wattage)
  end

  def module_update_params
    params.require(:post).permit(:id, :solar_module_id, :new_solar_module_brand, :new_solar_module_model, :new_solar_module_length, :new_solar_module_height, :new_solar_module_width, :new_solar_module_nominal_wattage)
  end

end
