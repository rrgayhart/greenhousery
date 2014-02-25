class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :service
      t.string :key
      t.string :etc
    end
  end
end
