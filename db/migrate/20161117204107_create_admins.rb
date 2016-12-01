class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.text :information

      t.timestamps null: false
    end
  end
end
