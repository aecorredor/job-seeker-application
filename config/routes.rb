Rails.application.routes.draw do
  
  root      'pages#home'
  
  get 'signup' => 'pages#signup' #pages does not use crud therefore the routes need to be added here
  get 'employerdashboard' =>'pages#employer_dashboard' #obviously these names suck but hey its a demo
  get 'seekerdashboard' =>'pages#seeker_dashboard'
  get 'viewapplicationsdashboard' =>'pages#view_applications_dashboard'
  get 'admindashboard' =>'pages#admin_dashboard'
  get 'results' => 'pages#search'
  resources :job_applications
  resources :job_postings

  devise_for :admins
  devise_for :employers
  devise_for :seekers, controllers: { registrations: 'seekers/registrations'} # this controller is so the user gets redirected to their home page after signing up
  resources :seekers, only: [:index, :show, :edit, :update, :destroy]
  resources :employers, only: [:index, :show, :edit, :update, :destroy]
  resources :admins, only: [:show, :edit, :update, :destroy]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
