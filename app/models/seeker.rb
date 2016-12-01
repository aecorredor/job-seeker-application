class Seeker < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_full_name, :against =>[:first_name, :last_name, :id]
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    has_many :job_applications, dependent: :destroy
    # im starting validations here
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
end