class ProjectArray < ActiveRecord::Base
  belongs_to :project
  belongs_to :solar_module
  attr_accessor :new_solar_module_brand, :new_solar_module_model, :new_solar_module_length, :new_solar_module_width, :new_solar_module_height, :new_solar_module_nominal_wattage
  has_many :points
  validates :project_id, presence: true
  after_validation :set_name

  def create_solar_module(params)
    solar_module = SolarModule.new
    solar_module.brand = params[:new_solar_module_brand]
    solar_module.model = params[:new_solar_module_model]
    solar_module.length = params[:new_solar_module_length].to_d
    solar_module.width = params[:new_solar_module_width].to_d
    solar_module.height = params[:new_solar_module_height].to_d
    solar_module.nominal_wattage = params[:new_solar_module_nominal_wattage].to_i
    if solar_module.save
      self.update_attributes(:solar_module_id => solar_module.id)
    end
  end

  def set_points(args)
    unless args[:length]
      args[:length] = args[:square_foot] / args[:width]
    end
    unless args[:width]
      args[:width] = args[:square_foot] /args[:length]
    end
    point1 = Point.new(x_coordinate: 0, y_coordinate: 0)
    point2 = Point.new(x_coordinate: args[:width], y_coordinate: 0)
    point3 = Point.new(x_coordinate: 0, y_coordinate: args[:length])
    point4 = Point.new(x_coordinate: args[:width], y_coordinate: args[:length])
    points = [point1, point2, point3, point4]
    points.each do |point|
      point.z_coordinate = 0
      point.project_array_id = self.id
      point.save
    end
  end

  def one_point(args)
    
  end
  

  def set_name
    unless self.name
      self.name = "#{self.project.name} Array"
      self.save
    end
  end
end
