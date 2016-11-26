class AddReferences < ActiveRecord::Migration
  def change
    add_reference :employers, :job_postings, index: true
    add_reference :seekers, :job_applications, index: true
    add_reference :job_postings, :job_applications, index: true  
  end
end
