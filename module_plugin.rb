require 'sketchup.rb'
UI.menu('PlugIns').add_item('Generate Hyundai hiS 230') { Panel.new }
class Panel
  attr_reader :run, :width, :thickness
  def initialize
    @run = 34.6
    @width = 68.7
    @thickness = 1.38
    draw_panel
  end
  def draw_panel 
    model = Sketchup.active_model
    group = model.entities.add_group
    entities = group.entities
    new_panel = entities.add_face(coordinates[0], coordinates[1], coordinates[2], coordinates[3])
    new_panel.reverse!
    new_panel.pushpull(thickness, true)
    group.to_component
  end
  def coordinates
    x1 = 0
    x2 = width
    y1 = 0
    y2 = run
    pts = []
    pts[0] = [x1, y1]
    pts[1] = [x2, y1]
    pts[2] = [x2, y2]
    pts[3] = [x1, y2]
    pts
  end
end
