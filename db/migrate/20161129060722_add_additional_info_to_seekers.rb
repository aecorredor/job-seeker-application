class AddAdditionalInfoToSeekers < ActiveRecord::Migration
  def change
    add_column :seekers, :university, :string
  end
end
