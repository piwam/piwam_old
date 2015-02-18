class CreateContributionTypes < ActiveRecord::Migration
  def change
    create_table :contribution_types do |t|
      t.string  :label,      null: false
      t.date    :expires_on, null: false
      t.decimal :amount,     null: false, precision: 5, scale: 2
      t.integer :contributions_count, null: false, default: 0
      t.boolean :active,     null: false, default: true
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
