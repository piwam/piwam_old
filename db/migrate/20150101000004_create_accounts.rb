class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string  :label,     null: false
      t.string  :reference, null: false
      t.boolean :active,    null: false, default: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end

    add_foreign_key :accounts, :members, column: :created_by
    add_foreign_key :accounts, :members, column: :updated_by
  end
end
