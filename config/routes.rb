Rails.application.routes.draw do
  # get ''
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'page#home'
  get '/landing' => 'page#landing'
  get '/register' => 'page#register'
  get '/manager' => 'page#manager'
  get '/student' => 'page#student'
  post '/register_user' => 'page#register_user'
  post '/user_landing' => 'page#user_landing'
  post '/student_landing' => 'page#student_landing'
  get '/siji'=>'page#siji'
  get '/liuji'=>'page#liuji'
  post '/register_siji'=>'page#register_siji'
  post '/finding'=>'page#finding'
  post '/siji_all'=>'page#siji_all'
  post '/register_liuji'=>'page#register_liuji'
  post '/liuji_all'=>'page#liuji_all'
  # get '/show'=>'page#show'
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
