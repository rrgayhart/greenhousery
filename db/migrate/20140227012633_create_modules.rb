class CreateModules < ActiveRecord::Migration
  def change
    create_table :modules do |t|
      t.string :brand
      t.string :model
      t.decimal :length
      t.decimal :width
      t.decimal :height
      t.integer :nominal_wattage
    end
  end
end
