class PointsController < ApplicationController
  respond_to :html, :json  

  def new
    @point = Point.new
  end

  def create
    @point = Point.new(point_params)
    if @point.save
      redirect_to @point.project_array.project
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @point = Point.find(params[:id])
  end

  def update
    @point = Point.find(params[:id])
    @point.update_attributes(point_params)
    respond_with @point
  end
 
  def edit
  end

  def format_point
    @point = Point.new
    @point.x_coordinate = params[:x_coordinate].to_d
    @point.y_coordinate = params[:y_coordinate].to_d
    @point.project_array_id = params[:project_array_id]
    @point.save
    redirect_to project_path(current_user.projects.last)
  end

  private
  
  def point_params
    params.permit(:project_array_id, :x_coordinate, :y_coordinate, :z_coordinate)
  end

end
