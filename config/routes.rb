Rails.application.routes.draw do

  get 'auth0/callback'

  get 'auth0/failure'

get "/auth/oauth2/callback" => "auth0#callback"
get "/auth/failure" => "auth0#failure"

  resources :notices
  
# namespace :api do
#   devise_for :users
#   resources :catalogues, :only=>[:index, :show]
# end

  namespace :api do
    namespace :v1 do
      # devise_for :users
      resources :catalogues, only: [:index, :create, :show, :update, :destroy]
    end
  end
  get 'contacts/index'

  get 'contacts/new'
  
  # devise_for :admins, controllers: {     
    # sessions: 'admins/sessions'
    # registrations: 'users/registrations',
    # passwords: 'users/passwords' 
  # }
    
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  resources :artworks
  get 'artworks/add_form', to: 'artworks#add_form', as: 'add_form_artwork'
    
  resources :catalogues, model_name: 'Catalogue' do
    resources :players
    resources :pages
    resources :artworks
    get 'catalogues/1/artworks/add_form', to: 'artworks#add_form', as: 'add_form_artwork'
  end
   
  resources :artists, model_name: 'Artist' do
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
  get 'dashboards/notices/:id' => 'dashboards#notices'
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
