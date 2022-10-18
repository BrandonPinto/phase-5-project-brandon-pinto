Rails.application.routes.draw do
  resources :participants, only: [:index]
  resources :community_events, only: [:show, :index, :create, :update, :destroy]
  resources :contacts, only: [:show, :index, :create, :update, :destory]
  resources :users, only: [:show, :index, :create, :update]
  resources :personal_events, only: [:index, :show, :create, :destroy, :update]

#Personal_events routes here
get "/personal_events-all", to: "personal_events#index"
post "/personal_events-create", to: "personal_events#create"
delete "/personal_events-destroy", to: "personal_events#destroy"
patch "/personal_events-update", to: "personal_events#update"
get "/personal_events-show", to: "personal_events#user_personal_events"
#community_events routes here
get "/community_events-all", to: "community_events#index"
get "/community_events-participants", to: "community_events#show_community_participants"
post "/community_events-create", to: "community_events#create"
patch "/community_events-update", to: "community_events#update"
delete "/community_events-delete", to: "community_events#destroy"
#users routes here
get "/users-all", to: "users#index"
get "/me", to: "users#show"
get "/login-user", to: "users#login"
post "/signup-create", to: "users#create"
patch "/users-update", to: "users#update"
# participants route here
get "/participants", to: "participants#index"
#contacts routes here
get "/contacts-all", to: "contacts#index"
post "/contacts-create", to: "contacts#create"
patch "/contacts-update", to: "contacts#update"
get "/contacts-show", to: "contacts#show"
delete "/contacts-delete", to: "contacts#destroy"

end
