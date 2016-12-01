class JobApplication < ActiveRecord::Base
    belongs_to :seeker
    belongs_to :job_posting
    
    validates :cover_letter, presence: true  
    validates :seeker_id, presence: true
    validates :job_posting_id, presence: true
end
