Rails.application.routes.draw do

#Personal_events routes here
get "/personal_events", to: "personal_events#index"
get "personal_events/:id", to: "personal_events#show"
post "/personal_events", to: "personal_events#create"
delete "/personal_events", to: "personal_events#destroy"
patch "/personal_events", to: "personal_events#update"
#community_events routes here
get "/community_events", to: "community_events#index"
# get "/community_events/:id", to: "community_event#show_community_participants"
post "/community_events", to: "community_events#create"
patch "/community_events", to: "community_events#update"
delete "/community_events", to: "community_events#destroy"
#users routes here
get "/users", to: "users#index"
get "/me", to: "users#show"
get "/users/:id", to: "users#show"
post "/login", to: "users#login"
post "/signup", to: "users#create"
patch "/users", to: "users#update"
# participants route here
get "/participants", to: "participants#index"
post "/participants", to: "participants#create"
#contacts routes here
get "/contacts", to: "contacts#index"
post "/contacts", to: "contacts#create"
patch "/contacts", to: "contacts#update"
get "/contacts", to: "contacts#show"
delete "/contacts", to: "contacts#destroy"

end
