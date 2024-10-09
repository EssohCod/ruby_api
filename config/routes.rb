# Rails.application.routes.draw do
#   # GraphQL route
#   post "/graphql", to: "graphql#execute"
#   get "/graphql", to: "graphql#execute" # Allows GraphiQL to send GET requests to test queries

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
  # Root route for a welcome message
  root to: -> (env) { [200, { "Content-Type" => "application/json" }, [{ message: "Welcome to the Earthquake API" }.to_json]] }

  # GraphQL route
  post "/graphql", to: "graphql#execute"
  get "/graphql", to: "graphql#execute" # Allows GraphiQL to send GET requests to test queries

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
