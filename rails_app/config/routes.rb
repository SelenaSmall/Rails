Rails.application.routes.draw do
  root 'organisations#index'

  get 'org/:id' => 'organisations#show', as: 'organisation'
  resources :organisations, only: [:new, :edit, :update, :destroy]

  get 'org/:id/venues/' => 'venues#index', as: 'organisations_venues' 
  get 'org/:slug/venues/new' => 'venues#new', as: 'organisations_venue_new'

  get 'v/:id' => 'venues#show', as: 'venue' 

  get 'v/:slug/grid' => 'tables#grid', as: 'grid'
  get 'v/:slug/plan' => 'tables#plan', as: 'plan'
  get 'v/:slug/runsheet' => 'tables#runsheet', as: 'runsheet'
  
  resources :venues, only: [:edit, :update, :destroy] do
    resources :users, shallow: true
    resources :customers, shallow: true
    resources :covers, except: [:show]
    resources :hours, shallow: true, except: [:show]
    resources :sections, shallow: true, except: [:show]
    resources :tables, shallow: true, except: [:show]
    resources :bookings, shallow: true
  end

#  get 'v/:slug/covers' => 'covers#index', as: 'covers'
#  get 'v/:slug/covers/new' => 'covers#new', as: 'covers_new'
#  get 'v/:slug/covers/edit' => 'covers#edit', as: 'covers_edit'
#  post 'v/:slug/covers' => 'covers#create'
#  patch 'v/:slug/covers' => 'covers#update'
#  put 'v/:slug/covers' => 'covers#update'
#  delete 'v/:slug/covers' => 'covers#destroy'

#resources :organisations # do

#  get 'v/:slug/hours' => 'hours#index', as: 'hours'
#  get 'v/:slug/sections' => 'sections#index', as: 'sections'
#  get 'v/:slug/tables' => 'tables#index', as: 'tables'

#      resources :bookings
#      resources :tables
#      get 'grid' => 'tables#index' 
#      resources :plans
#      resources :hours do
#        get 'edit_all', on: :collection
#      end
#     resources :covers do
#        get 'edit_all', on: :collection
#      end
#      resources :sections do
#        get 'edit_all', on: :collection
#      end
#      resources :tables do
#        get 'edit_all', on: :collection
#      end
#      resources :notes do
#        get 'edit_all', on: :collection
#      end
#    end
#  end

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
