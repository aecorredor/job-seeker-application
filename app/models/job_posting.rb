class JobPosting < ActiveRecord::Base
    belongs_to :employer
    validates :position, presence: true, length: { maximum: 50 }
    validates :location, presence: true, length: { maximum: 50 }
    validates :job_type, presence: true, length: { maximum: 50 }
    validates :job_description, presence: true
    validates :pay, presence: true
end