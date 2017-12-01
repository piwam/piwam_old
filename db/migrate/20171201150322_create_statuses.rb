class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.string :label, null: false
      t.integer :members_count, null: false, default: 0

      t.timestamps
    end
  end
end
