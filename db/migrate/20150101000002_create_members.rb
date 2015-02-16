class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string     :last_name,  null: false
      t.string     :first_name, null: false
      t.string     :email
      t.string     :password_digest
      t.integer    :status_id
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
      t.boolean    :active, default: true
      t.float      :latitude
      t.float      :longitude
      t.integer    :created_by
      t.integer    :updated_by

      t.timestamps null: false
    end
  end
end
