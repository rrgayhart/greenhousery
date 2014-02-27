class AddLengthAndWidthToProjectArray < ActiveRecord::Migration
  def change
    add_column :project_arrays, :length, :decimal
    add_column :project_arrays, :width, :decimal
    add_column :project_arrays, :panel_spacing_side, :decimal, :default => 1
    add_column :project_arrays, :panel_spacing_back, :decimal
    add_column :project_arrays, :tilt_degrees, :integer, :default => 30
    add_column :project_arrays, :horizontal, :boolean, :default => true
    add_column :project_arrays, :kw_predicted, :decimal
    add_column :project_arrays, :kw_goal, :decimal
    add_column :project_arrays, :panel_count_predicted, :integer
  end
end
