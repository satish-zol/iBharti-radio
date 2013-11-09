IbhartiRadio::Application.routes.draw do
  root :to => "main#index" 
  ActiveAdmin.routes(self)

    devise_for :admin_users, ActiveAdmin::Devise.config
    devise_for :users, 
        :controllers => { 
          :sessions           => 'devise/sessions', 
          :registrations      => 'devise/registrations', 
          :confirmations      => 'devise/confirmations', 
          :passwords          => 'devise/passwords',
          :omniauth_callbacks => 'users/omniauth_callbacks'
        },
        :path => '',
        :path_names => {:sign_in => 'users/sign_in', :sign_out => 'users/sign_out', :sign_up => 'users/sign_up'}

    namespace :api do
      devise_for :users, :controllers => { 
          :sessions           => 'api/sessions', 
          :registrations      => 'api/registrations', 
          :confirmations      => 'api/confirmations' 
          #:passwords          => 'devise/passwords',
          #:omniauth_callbacks => 'users/omniauth_callbacks'
        }  
    end  

 
  resources :users  

  resources :colleges

  resources :cities

  resources :song_uploads

  resources :songs

  resources :tags

  resources :languages

  resources :categories
  #resources :admin_songs_show_playlist


  match 'index' => 'main#index'
  match 'live_station' => 'main#live_station'
  match 'songs_by_lang' => 'main#songs_by_lang'
  match 'songs_by_cat' => 'main#songs_by_cat'
  match 'show_playlist' => 'admin/songs#show_playlist'
  match 'create_playlist' => 'admin/songs#create_playlist'
  match 'show_songs_in_playlist' => 'admin/songs#show_songs_in_playlist'
  match 'shout_playlist/:id' => 'colleges#shout_playlist'
  match 'collegeradio_play_page' => 'main#collegeradio_play_page'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
