class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string  :label,  null: false
      t.boolean :active, null: false, default: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end

    add_foreign_key :activities, :members, column: :created_by
    add_foreign_key :activities, :members, column: :updated_by
  end
end
