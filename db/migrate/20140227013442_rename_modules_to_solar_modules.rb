class RenameModulesToSolarModules < ActiveRecord::Migration
  def change
    rename_table :modules, :solar_modules
  end
end
