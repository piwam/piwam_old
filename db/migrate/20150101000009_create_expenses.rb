class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string     :label,    null: false
      t.decimal    :amount,   null: false
      t.references :account,  null: false, index: true
      t.references :activity, null: false, index: true
      t.date       :date,     null: false
      t.boolean    :paid,     null: false, default: true
      t.integer    :created_by
      t.integer    :updated_by

      t.timestamps null: false
    end

    add_foreign_key :expenses, :accounts
    add_foreign_key :expenses, :activities
  end
end
