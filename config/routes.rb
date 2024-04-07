Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # root "pages#home"

  # Landing Pages
  root "home#index"
  get "/about", to: "home#about"
  get "/privacy-policy", to: "home#privacy_policy"

  # Contact
  get "/contact", to: "home#contact"
  get "contacts/new", to: "contacts#new"
  post "contacts/create", to: "contacts#create"

  # Access Pages
  resources :blogs do
    member do
      get 'preview'
    end
  end

  resources :projects do
    member do
      get 'preview'
    end
  end
  

end
