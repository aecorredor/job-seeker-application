class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
      t.text :cover_letter
      t.timestamps null: false
    end
  end
end
