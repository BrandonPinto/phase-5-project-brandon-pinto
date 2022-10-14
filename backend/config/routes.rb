Rails.application.routes.draw do
  resources :calendars
  resources :users
  resources :appointments
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
