class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string  :label,         null: false
      t.integer :members_count, null: false, default: 0
      t.boolean :active,        null: false, default: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
