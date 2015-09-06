Rails.application.routes.draw do
  get 'bookings/index'
  get 'covers/index'

  get 'organisations/bookings'
  get 'organisations/customers'

  get 'organisations/bookings'
  get 'organisations/customers'
  get 'organisations/users'
  get 'organisations/venues'
  get 'organisations/venues/hours'
  get 'organisations/venues/covers'
  get 'organisations/venues/sections'

  get 'v/:slug/grid' => 'tables#grid', as: 'grid'
  get 'v/:slug/plan' => 'tables#plan', as: 'plan'
  get 'v/:id' => 'venues#show', as: 'venue'

  resources :organisations do
    resources :users
    resources :customers
    resources :bookings
    resources :reports
    resources :venues do
    #  resources :details
      resources :users
      resources :customers
      resources :bookings
      resources :reports
      resources :tables
      get 'grid' => 'tables#index' 
      resources :plans
      resources :hours do
        get 'edit_all', on: :collection
      end
      resources :covers do
        get 'edit_all', on: :collection
      end
      resources :sections do
        get 'edit_all', on: :collection
      end
      resources :tables do
        get 'edit_all', on: :collection
      end
      resources :notes do
        get 'edit_all', on: :collection
      end
    end
  end


  resources :customers  do
    resources :bookings
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'organisations#index'

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
