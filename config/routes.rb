Rails.application.routes.draw do

  get 'contacts/index'

  get 'contacts/new'

  # get 'catalogues/artwork_new'
  # get 'catalog'
  # post 'catalogues/artwork_create'
  # post 'artworks/artwork_upload_catalogue'
  devise_for :admins
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  resources :catalogues, model_name: 'Catalogue' do
    resources :players
    resources :pages
    resources :artworks
  end
  resources :artworks  
  resources :artists do
    resources :contacts
    resources :histories
  end
  resources :exhibitions
  resources :spaces do
    resources :contacts
  end
  
  # resources :histories
  # resources :contacts
  
  get 'dashboards/index'
  get 'dashboards/help'
  get 'home/index'

  
  root 'dashboards#index'
  # get 'artists/index'

  # get 'spaces/index'

  # get 'exhibition/index'


  # get 'catalogues/artwork_create'

  


  # get 'artworks/index'

  # get 'catalogues/index'
  # get 'catalogues/new'


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
