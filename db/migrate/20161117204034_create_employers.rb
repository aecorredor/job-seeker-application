class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company_name
      t.string :rep_fname
      t.string :rep_lname
      t.string :phone
      t.string :address
      t.date :founded
      t.text :company_info

      t.timestamps null: false
    end
  end
end
