class CreateProjectArrays < ActiveRecord::Migration
  def change
    create_table :project_arrays do |t|
      t.string :name
      t.references :project, index: true
      t.decimal :sqft
    end
  end
end
