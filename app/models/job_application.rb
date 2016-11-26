class JobApplication < ActiveRecord::Base
    belongs_to :seeker, :job_posting
    validates :cover_letter, presence: true
end
