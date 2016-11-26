class AddAboutAndWorkToSeekers < ActiveRecord::Migration
  def change
    add_column :seekers, :about, :text
    add_column :seekers, :major, :string
    
    add_column :seekers, :work_experience1_title, :string
    add_column :seekers, :work_experience2_title, :string
    add_column :seekers, :work_experience3_title, :string
    
    add_column :seekers, :work_experience1_company, :string
    add_column :seekers, :work_experience2_company, :string
    add_column :seekers, :work_experience3_company, :string
    
    add_column :seekers, :work_experience1_start, :date
    add_column :seekers, :work_experience2_start, :date
    add_column :seekers, :work_experience3_start, :date 
      
    add_column :seekers, :work_experience1_end, :date
    add_column :seekers, :work_experience2_end, :date
    add_column :seekers, :work_experience3_end, :date
    
    add_column :seekers, :work_experience1_description, :text
    add_column :seekers, :work_experience2_description, :text
    add_column :seekers, :work_experience3_description, :text
  end
end
