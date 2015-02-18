class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string     :last_name,  null: false
      t.string     :first_name, null: false
      t.string     :email
      t.string     :password_digest
      t.references :status, index: true
      t.attachment :photo
      t.date       :registered_on
      t.boolean    :exempt_of_contributions, default: false
      t.string     :street
      t.string     :postal_code
      t.string     :city
      t.string     :country
      t.string     :website
      t.string     :phone_number
      t.string     :mobile_number
      t.float      :latitude
      t.float      :longitude
      t.boolean    :active, null: false, default: true
      t.integer    :created_by
      t.integer    :updated_by

      t.timestamps null: false
    end

    add_foreign_key :members, :statuses
  end
end
