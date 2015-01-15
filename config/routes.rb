MacroQueryApp::Application.routes.draw do
  get "url_list/index"
  get "home/user_submissions"

  get "url_list/new"

  get "static_pages/global_leader_board",to:'static_pages#global_leader_board', as: 'leader_board'
  get "url_list/create"

  devise_for :users
  root :to => "static_pages#home"
  
  #root :to => 'devise/sessions#new'
  
  #get "static_pages/home"
  get 'home/search_results', to:'home#search_results', as: 'search_results'
  get 'home/time_stamp_create', to:'home#time_stamp_create', as: 'prepare_game'
  get 'home/score_board',to:'home#score_board',as:'user_score_board'

  get 'static_pages/normal_score_card', to:'static_pages#normal_score_card',as: 'normal_score_card'
  

  get 'home/index', to:'home#index', as: 'game_root'
  get 'static_pages/home', to:'static_pages#home',as: 'user_root'
  get 'home/score_card', to:'home#score_card',as: 'score_card_update'
  devise_scope :user do
    get "login", :to => "devise/sessions#new"
    get "log_out", :to => "devise/sessions#destroy"
  end
  resources :users do
    resources :url_list
  end


  
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
