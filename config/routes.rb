AwesomeAnswers::Application.routes.draw do
  devise_for :users
  root 'projects#index'

  get "/password" => "home#password"

  get "/about_us" => "home#about"

  get "/help" => "help#index"

  # get "/questions" => "questions#index"
  # post "/questions" => "questions#create"
  # get "/questions/:id" => "questions#show"
  # get "/questions/:id/edit" => "questions#edit"
  # get "/questions/new" => "questions#new"
  # patch "questions/:id" => "questions#update"
  # delete "questions/:id" => "questions#destroy"
  # post "questions/:id/comments" => "comments#create"
  # 
  # 
  
  resources :questions do
    resources :answers
    member do#create a special action of vote_up int he controller. on: :member makes it take an ID
      post :vote_up 
      post :vote_down
    end
    post :search, on: :collection#collection means NO ID...
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
