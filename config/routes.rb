Rails.application.routes.draw do
  
  get 'static_pages/demo'

  get 'static_pages/about'

  get 'static_pages/contact'

  # the below generated route is not necessary
  # get 'sessions/new'

  # delete user route
  #get 'delete' => 'users#delete'

  # shortened routes, per railscast comment
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'

  # add routes for static pages
  get 'demo' => 'static_pages#demo'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  # get 'signup', to: 'users#new', :as 'signup'
  # get 'login', to: 'sessions#new', :as 'login'
  # get 'logout', to: 'sessions#destroy', :as 'logout'

  # match 'contact' => 'contact#new', :as => 'contact', :via => :get
  # match 'contact' => 'contact#create', :as => 'contact', :via => :post

  resources :users
  resources :sessions
  resources :static_pages

  root to: 'users#new'

  # get 'users/new'

  # the below line specifies JSON as the default API format
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :users
    end
  end

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
