class AddModuleIdToProjectArray < ActiveRecord::Migration
  def change
    add_column :project_arrays, :solar_module_id, :integer
    add_index :project_arrays, :solar_module_id
  end
end
