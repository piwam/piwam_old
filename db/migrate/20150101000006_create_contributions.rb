class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.references :account,           null: false, index: true
      t.references :contribution_type, null: false, index: true
      t.references :member,            null: false, index: true
      t.date       :date,              null: false
      t.decimal    :amount,            null: false, precision: 5, scale: 2
      t.integer    :created_by
      t.integer    :updated_by

      t.timestamps null: false
    end

    add_foreign_key :contributions, :accounts
    add_foreign_key :contributions, :contribution_types
    add_foreign_key :contributions, :members
    add_foreign_key :contributions, :members, column: :created_by
    add_foreign_key :contributions, :members, column: :updated_by
  end
end
