class Admin < ActiveRecord::Base
    # im starting validations here
    before_save { self.email = self.email.downcase }
    
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :phone, presence: true, length: { minimum: 10, maximum: 10 }
    validates :address, presence: true, length: { maximum: 255 }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
