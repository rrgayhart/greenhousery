class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
    gon.latitude = @project.latitude
    gon.longitude = @project.longitude
  end

  private
  
  def project_params
    params.require(:project).permit(:name, :user_id, :street, :city, :state, :country, :latitude, :longitude, :sqft)
  end

end
