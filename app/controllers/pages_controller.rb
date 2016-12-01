class PagesController < ApplicationController
    def home
        if employer_signed_in?
            redirect_to employerdashboard_path
        elsif seeker_signed_in?
            redirect_to seekerdashboard_path
        elsif admin_signed_in?
            redirect_to admindashboard_path
        end
        
    end
    
    def signup
    end
    
    def search
      if params[:query].present?
          if employer_signed_in?
              #search seekers
              @seekers = Seeker.search_by_full_name(params[:query])
          elsif seeker_signed_in?
                #search for postings
              @job_postings = JobPosting.search_job(params[:query])
          elsif admin_signed_in?
              #search both?
              @seekers = Seeker.search_by_full_name(params[:query])
              @employers = Employer.search_employer(params[:query])
          end
      else
        redirect_to root_path
      end
    end
    
    #should redirect to these dashboards immediately after signing in, and of course after registration(which should double as a sign in)
    def employer_dashboard
        if employer_signed_in?
            # how are u catching the no record found then? employer has to be signed in so there should never be a no record found
            @employer = Employer.find(current_employer.id)
            @job_postings = JobPosting.where("employer_id = ?", current_employer.id) #.paginate(page: params[:page])
        else 
            redirect_to root_url
        end
    end
    
    def seeker_dashboard
        if seeker_signed_in?
            @seeker = Seeker.find(current_seeker.id) #uncommented if you want to use @seeker.methods
            @job_applications = JobApplication.where("seeker_id = ?", current_seeker.id) #.paginate(page: params[:page])
            @job_postings = JobPosting.all
        else 
            redirect_to root_url
        end
    end
    
    def view_applications_dashboard
        if seeker_signed_in?
            @seeker = Seeker.find(current_seeker.id) #uncommented if you want to use @seeker.methods
            @job_applications = JobApplication.where("seeker_id = ?", current_seeker.id) #.paginate(page: params[:page])
            @job_postings = JobPosting.all
        else 
            redirect_to root_url
        end
    end
    
    def admin_dashboard
        if admin_signed_in?
            #just something to put in the admin page
            @admin = Admin.find(current_admin.id)
            # @countseekers = Seeker.all.count #might be an error
            # @countemployers = Employer.all.count
            # @countjobs = JobPosting.all.count
            # @countapplications = JobApplication.all.count
            # #probably do nothing else
        else
            redirect_to root_url
        end
    end
end
