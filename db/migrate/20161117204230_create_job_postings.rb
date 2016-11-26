class CreateJobPostings < ActiveRecord::Migration
  def change
    create_table :job_postings do |t|
      t.string :position
      t.string :location
      t.string :job_type
      t.text :job_description
      t.float :pay
      t.timestamps null: false
    end

  end
end
