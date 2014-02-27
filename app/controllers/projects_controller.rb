class ProjectsController < ApplicationController
  respond_to :html, :json  

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.state = params[:state]
    @project.user_id = current_user.id if current_user
    if @project.save
      @project_array = ProjectArray.create(project: @project)
      @project.get_station_data
      redirect_to edit_project_array_path(@project_array)
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_arrays = @project.project_arrays
    gon.latitude = @project.latitude
    gon.longitude = @project.longitude
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(project_params)
    respond_with @project
  end
 
  def edit
  end

  private
  
  def project_params
    params.require(:project).permit(:name, :user_id, :street, :city, :state, :country, :latitude, :longitude, :sqft)
  end

end
