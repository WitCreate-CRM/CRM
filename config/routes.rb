Witcrm::Application.routes.draw do
  
<<<<<<< HEAD
  resources :huespedes
=======
  resources :huespedes do
    resources :telefonos
    resources :cortesias do 
      get :autocomplete_alimento_descripcion, :on => :collection
    end 
    resources :preferencias
  end
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b


  resources :sugerenciasyquejas do
    get :autocomplete_huesped_primer_nombre, :on => :collection
  end


  resources :tiposdehabitaciones


  resources :tiposdeidentificaciones


  resources :empleados do 
    resources :telefonos
  end


  resources :visitas


  resources :contactos


<<<<<<< HEAD
  resources :cortesias


  resources :preferencias


=======
>>>>>>> 2d302407786e22f7976665e2b1d8fac36cfe483b
  resources :obsequios


  resources :alimentos


  resources :cargos


  resources :departamentos


  resources :empresas


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
