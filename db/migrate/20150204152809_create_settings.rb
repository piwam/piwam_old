class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string  :var,        null: false
      t.text    :value
      t.integer :thing_id
      t.string  :thing_type, limit: 30

      t.timestamps
    end
    
    add_index :settings, [ :thing_type, :thing_id, :var ], unique: true
  end
end
