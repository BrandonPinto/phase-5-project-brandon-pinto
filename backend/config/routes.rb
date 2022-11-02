Rails.application.routes.draw do

#Personal_events routes here
get "/personal_events", to: "personal_events#index"
get "user/personal_events", to: "personal_events#show"
post "/personal_events/user", to: "personal_events#create"
delete "/personal_events/:id", to: "personal_events#destroy"
patch "/personal_events/:id", to: "personal_events#update"
#community_events routes here
get "/community_events", to: "community_events#index"
get "/community_events/:id", to: "community_events#show"
post "/community_events", to: "community_events#create"
patch "/community_events/:id", to: "community_events#update"
delete "/community_events/:id", to: "community_events#destroy"
#users routes here
get "/me", to: "users#show"
get "/users", to: "users#index"
post "/login", to: "users#login"
post "/signup", to: "users#create"
patch "/users", to: "users#update"
# participants route here
get "/participants", to: "participants#index"
post "/participants", to: "participants#create"
delete "/participants/:id", to: "participants#destroy"
#contacts routes here
get "/contacts", to: "contacts#index"
get "/contacts/:id", to: "contacts#show"
post "/contacts", to: "contacts#create"
patch "/contacts/:id", to: "contacts#update"
delete "/contacts/:id", to: "contacts#destroy"
#Host priv routes
delete "/person_to_remove/:id", to: "community_events#remove_participant"
get "/community_events/:id/participants", to: "community_events#show_event_participants"
#all events relating to current user
get "/events", to: "users#all_events"
end
