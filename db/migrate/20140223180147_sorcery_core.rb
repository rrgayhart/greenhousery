class SorceryCore < ActiveRecord::Migration
   change_table :users do |t|
      t.string :crypted_password
      t.string :salt
  end
end
