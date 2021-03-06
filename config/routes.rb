Greenhousery::Application.routes.draw do
  resources :points
  resources :users
  resources :projects
  resources :project_arrays
  resources :sessions
  resources :solar_modules

  get "home/about"
  get "home/index"
  get "home/test"
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"

  get "/project_array/:id/edit_modules" => "project_arrays#edit_modules", :as => "edit_modules"
  
  get "/project_array/:id/edit_layout" => "project_arrays#edit_layout", :as => "edit_layout"
  post "update_layout" => "project_arrays#update_layout", :as => "update_layout"

  post "update_measurements" => "project_arrays#update_measurements", :as => "update_measurements"
  post "update_module" => "project_arrays#update_module", :as => "update_module"

  post "format_point" => "points#format_point", :as => "format"

  root 'home#index'
  
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
