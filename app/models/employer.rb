class Employer < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_employer, :against =>[:company_name, :id]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :job_postings, dependent: :destroy
    
    before_save { self.email = self.email.downcase }
    
    validates :company_name, presence: true, length: { maximum: 50 }
    validates :rep_fname, presence: true, length: { maximum: 50 }
    validates :rep_lname, presence: true, length: { maximum: 50 }
    validates :phone, length: { maximum: 10 }
    validates :address, length: { maximum: 255 }
end