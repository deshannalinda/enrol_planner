EnrolPlanner::Application.routes.draw do

  get "system_manager/db_drop"
  get "system_manager/db_create"
  get "system_manager/db_migrate"
  get "system_manager/db_seed"
  get "system_manager/db_init"
  get "system_manager/update"
  get "system_manager/index"
  resources :pre_req_groups

  resources :planner do
	  collection do
		  get "enrolment_planner"
	  end
  end
  resources :download do
	  collection do
		  get "csv"
		  post "csv"
	  end
  end
  resources :admin
  resources :users
  resources :user_sessions

  resources :units do 
    collection { post :import }
  end

  resources :streams do 
    collection { post :import }
  end

  resources :stream_units do
    collection { post :import }
  end

  resources :pre_req_checker
  
  get "planner/send_email"
  get "planner/sembox"
  get "download/index"
  get "download/pdf"
  get "download/csv"
  get "user_sessions/new"
  get "user_sessions/create"
  get "user_sessions/destroy"
  get 'login' => 'user_sessions#new', :as => :login
  
  post "planner/unit_chooser" => "planner#unit_chooser"
  post "planner/enrolment_planner" => "planner#enrolment_planner"
  post "planner/sembox" => "planner#sembox"
  post "planner/send_email" => "planner#send_email"
  post "planner/validate" => "planner#validate"
  post "download/pdf" => "download#pdf"
  post "download/csv" => "download#csv"
  post "admin/login" => "admin#login"
  get 'logout' => 'user_sessions#destroy', :as => :logout

  root :to => 'users#index'

  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # root 'download#index'

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
