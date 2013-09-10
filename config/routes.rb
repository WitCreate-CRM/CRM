Witcrm::Application.routes.draw do

  resources :ultimavisitas


  resources :zonas


  get "pages/index"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"


  resources :sugerenciasyquejas do
    get :autocomplete_huesped_primer_nombre, :on => :collection
  end


  

  resources :empleados do
    resources :telefonos1
    resources :empresas do
      resources :contactos
    end
  end



  resources :huespedes do
    resources :telefonos
    resources :cortesias do 
      get :autocomplete_alimento_descripcion, :on => :collection
    end 
    resources :preferencias
  end



  resources :empresas do
    resources :contactos
  end




  resources :visitas do
    get :autocomplete_empleado_primer_nombre, :on => :collection
    get :autocomplete_obsequio_descripcion, :on => :collection
  end



  resources :visitas do
  resources :ultimavisitas
  end



  resources :users


  resources :sessions


  resources :obsequios


  resources :alimentos


  resources :cargos


  resources :departamentos


  resources :tiposdehabitaciones


  resources :tiposdeidentificaciones



 root :to => "sessions#index"

  


  
end
