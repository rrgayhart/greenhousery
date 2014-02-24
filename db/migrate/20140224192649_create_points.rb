class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :project_array, index: true
      t.decimal :x_coordinate
      t.decimal :y_coordinate
      t.decimal :z_coordinate
      t.decimal :length
    end
  end
end
