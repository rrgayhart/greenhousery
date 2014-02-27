class ProjectArray < ActiveRecord::Base
  belongs_to :project
  belongs_to :solar_module
  attr_accessor :new_solar_module_brand, :new_solar_module_model, :new_solar_module_length, :new_solar_module_width, :new_solar_module_height, :new_solar_module_nominal_wattage
  has_many :points
  validates :project_id, presence: true
  after_validation :set_name
  before_save :update_square_foot

  def get_number_of_panels
    horizontal = self.solar_module.width + self.panel_spacing_side
    vertical = self.solar_module.length + self.panel_spacing_back
    array_width_feet = Unitwise(self.width, 'foot')
    array_width_inches = array_width_feet.convert('inch')
    number_panels_per_row = (array_width_inches / horizontal).value.to_i
    array_length_feet = Unitwise(self.length, 'foot')
    array_length_inches = array_length_feet.convert('inch')
    number_of_rows = (array_length_inches / vertical).value.to_i
    predicted_panels = number_panels_per_row * number_of_rows
  end

  def get_predicted_kw
    watts = get_number_of_panels * self.solar_module.nominal_wattage
    wattage_unit = Unitwise(watts, 'watt')
    wattage_unit.convert('kilowatt').value
  end

  def convert_meter_to_feet(unit)
    distance = Unitwise(unit.to_i, 'meter')
    distance.convert('foot').value
  end

  def update_square_foot
    unless self.width.blank?
      self.sqft = self.width * self.length
    end
  end

  def convert_sq_meter_to_sq_feet(unit)
    distance = Unitwise(unit.to_i, 'm2')
    distance.convert('foot2').value
  end

  def to_plugin
    fname = "module_plugin.rb"
    somefile = File.open(fname, "w")
    somefile.puts "require 'sketchup.rb'"
    somefile.puts "UI.menu('PlugIns').add_item('Generate " + self.solar_module.brand + " " + self.solar_module.model + "') { Panel.new }"
    somefile.puts "class Panel"
    somefile.puts "  attr_reader :run, :width, :thickness"
    somefile.puts "  def initialize"
    somefile.puts "    @run = " + self.solar_module.width.to_s
    somefile.puts "    @width = " + self.solar_module.length.to_s
    somefile.puts "    @thickness = " + self.solar_module.height.to_s
    somefile.puts "    draw_panel"
    somefile.puts "  end"
    somefile.puts "  def draw_panel \n    model = Sketchup.active_model\n    group = model.entities.add_group\n    entities = group.entities\n    new_panel = entities.add_face(coordinates[0], coordinates[1], coordinates[2], coordinates[3])\n    new_panel.reverse!\n    new_panel.pushpull(thickness, true)\n    group.to_component\n  end"
    somefile.puts "  def coordinates\n    x1 = 0\n    x2 = width\n    y1 = 0\n    y2 = run\n    pts = []\n    pts[0] = [x1, y1]\n    pts[1] = [x2, y1]\n    pts[2] = [x2, y2]\n    pts[3] = [x1, y2]\n    pts\n  end"
    somefile.puts "end"
    somefile.close
    file = File.open(fname, "r")
    file.read
  end

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
