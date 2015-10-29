Rails.application.routes.draw do
  # this maps all GET request with URL "/hello" to WelcomeController/Index action
  get({"/hello" => "welcome#hello"})
  # get "/hello" => "welcome#index" (will not work for v < 2.20)

  # The routes files is basically a set of rules.
  # The routes file isn't aware of controllers' existence
  get({"/home" => "welcome#index"}) # this is totally legit

  # this ruby hash changes path (see localhost:3000/rails/info/routes for changes)
  # get({"/home" => "welcome#index", as: :hey})

  # when using a symbol-like string within a url, this means that it is a variable part of the url
  # it could be anything!
  # this is a dynamic url!!!!
  get({"/greeting/:name" => "welcome#greeting", as: :greeting})

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # get({"/index" => "welcome#hello"}) <= this will take precedence over following line
  get({"/index" => "welcome#index"})


  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root "welcome#index"
  # same as get({"/" => "welcome#index"})

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
