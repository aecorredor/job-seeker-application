https://job-seeking-site-helsing.c9users.io

https://github.com/plataformatec/devise/wiki

path for new view for login: x/sessions/new

path for new signup: x/registrations/new

SEARCH:

look at the symbols in models, they are methods. For example:
employer:

Employer.search_employer("pepsi cola best drink ever said no one ever") => ['pepsi', 'coca cola']

these should be used in controllers and saved into a variable such as @results
form should just be one field + submit



rake routes command shows routes. make sure to use devise ones

    # Confirms the correct user. Need one for each.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    X_logged_in? #already implemented for all 3, checks if current_user = X
    current_user #contains current user
    authenticate_X! already available and probably needed but I think we still need correct_user as above, forgot 
    before_action :method how to use them

# Create a migration with the required fields
create_table :admins do |t|
  t.string :email
  t.string :encrypted_password
  t.timestamps null: false
end

# Inside your Admin model
devise :database_authenticatable, :timeoutable

# Inside your routes
devise_for :admins

# Inside your protected controller
before_action :authenticate_admin!

# Inside your controllers and views
admin_signed_in?
current_admin
admin_session

    before_save { self.email = self.email.downcase }
    
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, 
                      length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :phone, length: { maximum: 10 }
    validates :address, length: { maximum: 255 }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }