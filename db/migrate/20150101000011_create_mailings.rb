class CreateMailings < ActiveRecord::Migration
  def change
    create_table :mailings do |t|
      t.string  :from,    null: false
      t.string  :to,      null: false
      t.string  :subject, null: false
      t.text    :body,    null: false
      t.integer :created_by

      t.timestamps null: false
    end

    add_foreign_key :mailings, :members, column: :created_by
  end
end
