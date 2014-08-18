class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_name
      t.string :phone_number
      t.string :city
      t.string :town
      t.text :address
      t.integer :user_id
      t.timestamps
    end
  end
end
