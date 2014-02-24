class ProjectArray < ActiveRecord::Base
  belongs_to :project
  has_many :points
  validates :project_id, presence: true
  after_validation :set_name

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
