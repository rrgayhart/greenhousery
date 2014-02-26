class AddStationToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :station_city, :string
    add_column :projects, :station_state, :string
    add_column :projects, :distance_from_station, :integer
    add_column :projects, :station_elevation, :integer
    add_column :projects, :station_timezone, :integer
  end
end
