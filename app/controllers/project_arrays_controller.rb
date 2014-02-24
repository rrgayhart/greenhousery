class ProjectsController < ApplicationController
  respond_to :html, :json  

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
  end

  def update
    @project_array = ProjectArray.find(params[:id])
    @project_array.update_attributes(project_array_params)
    respond_with @project_array
  end
 
  def edit
  end

  private
  
  def project_array_params
    params.require(:project_array).permit(:name, :project_id, :sqft)
  end

end
