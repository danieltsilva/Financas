Financas::Application.routes.draw do
  
  resources :invoices do
   member do
     get 'receive'
     get 'receiveexec/:account_id', :action => 'receiveexec', :as => 'receiveexec'
   end
  end

  resources :bills do 
    collection do
      get 'requests'
    end
    member do
      get 'approve'
      get 'approveexec'
      get 'pay'
      get 'payexec/:account_id', :action => 'payexec', :as => 'payexec'
    end
  end

  resources :categories

  resources :accounts

  resources :transactions

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
  match '/billets/gerar_boleto/:banco' =>'billets#gerar_boleto'
  # match '/home/boleto_hash' =>'home#boleto_hash'
  # match '/home/boleto_em_bloco' =>'home#boleto_em_bloco'
  # match '/home/multi_boleto' =>'home#multi_boleto'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
