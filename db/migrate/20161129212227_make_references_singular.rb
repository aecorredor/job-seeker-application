class MakeReferencesSingular < ActiveRecord::Migration
  def change
    remove_reference :employers, :job_postings
    remove_reference :job_postings, :job_applications
    remove_reference :seekers, :job_applications
    remove_reference :job_applications, :job_postings
    add_reference :job_applications, :job_posting, index: true 
    add_reference :job_postings, :employer, index: true
    add_reference :job_applications, :seeker, index: true
  end
end
