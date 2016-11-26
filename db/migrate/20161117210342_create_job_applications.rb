class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|

      t.timestamps null: false
    end
    add_reference :seeker, :job_application, index: true, foreign_key: true
    add_reference :job_posting, :job_application, index: true, foreign_key: true    
  end
end
