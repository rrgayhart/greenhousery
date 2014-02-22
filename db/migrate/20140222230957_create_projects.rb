class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.references :user, index: true
      t.float :latitude
      t.float :longitude
      t.float :sqft
      t.string :street
      t.string :city
      t.string :state
      t.string :country
    end
  end
end
