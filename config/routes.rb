Rails.application.routes.draw do
  get 'sessions/new'
  root "application#home"
  get '/signup' => 'users#new'
  get '/contact', to:'static_pages3#contact'
  get '/about', to: 'static_pages3#about'
  get '/home' , to: 'static_pages2#home'
  get '/help' , to: 'static_pages2#help'
  get    '/login',   to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'static_pages3/contact'
  get 'static_pages3/about'
  get 'static_pages2/home'
  get'static_pages2/help'
  resources :users
end
