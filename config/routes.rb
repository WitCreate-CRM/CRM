Witcrm::Application.routes.draw do
  
  get "pages/index"

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  resources :users

  resources :sessions
 

  resources :huespedes do
    resources :telefonos
    resources :cortesias do 
      get :autocomplete_alimento_descripcion, :on => :collection
    end 
    resources :preferencias
  end


  resources :sugerenciasyquejas do
    get :autocomplete_huesped_primer_nombre, :on => :collection
  end


  resources :tiposdehabitaciones


  resources :tiposdeidentificaciones


  resources :empleados


  resources :visitas


  resources :contactos


  resources :obsequios


  resources :alimentos


  resources :cargos


  resources :departamentos


  resources :empresas


 root :to => "sessions#new"

  


  
end
