class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.string     :label,    null: false
      t.decimal    :amount,   null: false
      t.references :account,  null: false, index: true
      t.references :activity, null: false, index: true
      t.date       :date,     null: false
      t.boolean    :received, null: false, default: true
      t.integer    :created_by
      t.integer    :updated_by

      t.timestamps null: false
    end

    add_foreign_key :incomes, :accounts
    add_foreign_key :incomes, :activities
    add_foreign_key :incomes, :members, column: :created_by
    add_foreign_key :incomes, :members, column: :updated_by
  end
end
