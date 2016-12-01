class CreateSeekers < ActiveRecord::Migration
  def change
    create_table :seekers do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.text :interests

      t.timestamps null: false
    end
  end
end
