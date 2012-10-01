Wishlisting::Application.routes.draw do
  
  resources :donations

  get "cloudinary/index"

  resources :images
  resources :wishlist_items
  resources :charities
  
  match 'image_upload/test' => 'image_upload#test'
  match 'list/:short_name/' => 'charities#list'
  match 'list/:short_name/return' => 'charities#return'
  match 'list/:short_name/thanks' => 'charities#thanks'
  match 'list/:short_name/:wishlist_item_id' => 'wishlist_items#show_for_list'
  match 'list/:short_name/:wishlist_item_id/donate' => 'wishlist_items#donate'
  match 'list/:short_name/:wishlist_item_id/thanks' => 'wishlist_items#thanks'
  match 'not_found/:short_name/' => 'charities#not_found'
  match 'wishlist_items/:id/upload_before_image' => 'wishlist_items#upload_before_image'

  #map.connect "home/:action", :controller => 'home', :action => /[a-z]+/i
  
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
