# Rails.application.routes.draw do
#   # GraphQL route
#   post "/graphql", to: "graphql#execute"
#   get "/graphql", to: "graphql#execute"

#   # GraphiQL interface (only in development)
#   if Rails.env.development?
#     mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
#   end

#   # OAuth (Doorkeeper)
#   use_doorkeeper

#   # Devise routes for user authentication
#   devise_for :users

#   # API namespace for earthquakes (v1)
#   namespace :api do
#     namespace :v1 do
#       resources :earthquakes
#     end
#   end
# end


Rails.application.routes.draw do
  # Set the root route to a specific controller action
  root "home#index"

  # Add a route for the home index if needed
  get "home/index"

  # GraphQL route
  post "/graphql", to: "graphql#execute"
  get "/graphql", to: "graphql#execute"

  # GraphiQL interface (only in development)
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  # OAuth (Doorkeeper)
  use_doorkeeper

  # Devise routes for user authentication
  devise_for :users

  # API namespace for earthquakes (v1)
  namespace :api do
    namespace :v1 do
      resources :earthquakes
    end
  end
end

# get '/favicon.ico', to: ->(_) { [204, {}, []] }