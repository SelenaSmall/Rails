Rails.application.routes.draw do
  root to: 'visitors#index'  

  get 'users/home' 

  get 'users/admin_home'
 
  get 'organisations/index' 
  
  devise_for :users, controllers: { registrations: 'users/registrations', passwords: 'users/passwords' }
  resources :users

#  get 'org/:id' => 'organisations#show', as: 'organisation'
  resources :organisations do #, only: [:new, :edit, :update, :destroy]
    resources :venues, only: [:new, :create]
  end

  get 'org/:organisation_id/venues/' => 'venues#index', as: 'organisations_venues' 
#  get 'org/:id/venues/new' => 'venues#new', as: 'organisations_venue_new'

  get 'venue/:id' => 'venues#show', as: 'venue' 
  get 'venue/new' => 'venues#new', as: 'new_venue'

  get 'venue/:slug/grid' => 'tables#grid', as: 'grid'
  get 'venue/:slug/plan' => 'tables#plan', as: 'plan'
  get 'venue/:slug/runsheet' => 'tables#runsheet', as: 'runsheet'
  
  resources :venues, only: [:edit, :update, :destroy] do

    resources :covers, except: [:show]
    resources :hours, except: [:show]
    resources :sections, except: [:show]
    resources :tables, except: [:show]
    resources :bookings, except: [:index]
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
