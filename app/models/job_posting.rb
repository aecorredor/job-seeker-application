class JobPosting < ActiveRecord::Base
    include PgSearch
    pg_search_scope :search_job, :against =>[:job_type, :job_description, :pay, :position, :location]
    
    has_many :job_applications, dependent: :destroy
    belongs_to :employer

    validates :position, presence: true, length: { maximum: 50 }
    validates :location, presence: true, length: { maximum: 50 }
    validates :job_type, presence: true, length: { maximum: 50 }
    validates :job_description, presence: true
    validates :pay, presence: true
end