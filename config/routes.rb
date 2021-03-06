StreetHeartProject::Application.routes.draw do

  resources :password_resets

  resources :payment_notifications

  resources :galleries


  resources :categories do
    get 'category' => 'category#index'
    get 'category' => 'category#show'
    post 'category' => 'category#create'
  end

  get 'carts' => 'carts#your_cart'

  get 'wishlist' => 'wishlists#your_wishlist'

  resources :wishlist_items
  resources :wishlists
  resources :orders

  get 'admin' => 'admin#index'
  get 'welcome' => 'welcome#home'
  get 'welcome' => 'welcome#about'
  get 'store' => 'store#index'
  get 'users' => 'users#index'
  get 'users' => 'users#new'
  get 'orders' => 'orders#thank_you'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :line_items
  resources :carts
  resources :store

  get "store/index"
  resources :products do
    get :who_bought, :on => :member
    resources :reviews
  end

  resources :sessions, :only => [:new, :create, :destroy]

  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout"
  match '/register' => "users#new", :as => "register"
  match '/home' => "welcome#home", :as => "home"
  match '/about' => "welcome#about", :as => "about"
  match '/your_profile' => "users#your_profile", :as => "your_profile"
  match '/thank_you' => "orders#thank_you", :as => "thank_you"

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

  root :to => "welcome", :action => "home"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
