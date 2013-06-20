Witcrm::Application.routes.draw do

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

    resources :huespedes do
      resources :telefonos
      resources :cortesias do 
        get :autocomplete_alimento_descripcion, :on => :collection
      end 
      resources :preferencias
    end
  end

<<<<<<< HEAD
=======
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
>>>>>>> bb8d897154d79e98d6ab07fcc0afb28f6a694602

resources :huespedes do
      resources :telefonos
      resources :cortesias do 
        get :autocomplete_alimento_descripcion, :on => :collection
      end 
      resources :preferencias
    end


  resources :visitas do
    get :autocomplete_empleado_primer_nombre, :on => :collection
    get :autocomplete_obsequio_descripcion, :on => :collection
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
