class AddReferenceToJobPostingFromJobApplications < ActiveRecord::Migration
  def change
    add_reference :job_applications, :job_postings, index: true 
  end
end
