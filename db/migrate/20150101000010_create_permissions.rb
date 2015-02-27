class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.references :member,     null: false, index: true
      t.string     :action,     null: false
      t.string     :controller, null: false
      t.integer    :created_by

      t.timestamps null: false
    end

    add_foreign_key :permissions, :members
  end
end
