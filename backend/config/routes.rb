Rails.application.routes.draw do
  resources :participants
  resources :community_events
  resources :contacts
  resources :users
  resources :personal_events

#Personal_events routes here
get "personal_events", to: "personal_events#index"
post "/personal_events", to: "personal_events#create"
delete "/personal_events", to: "personal_events#destroy"
patch "/personal_events", to: "personal_events#update"
get "/personal_events", to: "personal_events#user_personal_events"

end
