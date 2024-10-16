# module Types
#   class EarthquakeType < Types::BaseObject
#     field :id, ID, null: false
#     field :magnitude, Float, null: false
#     field :location, String, null: false
#     field :depth, Float, null: false
#   end

#   def earthquakes(limit:, offset:)
#     Earthquake.page(offset / limit + 1).per(limit)
#   end
# end

# module Types
#   class EarthquakeType < Types::BaseObject
#     field :id, ID, null: false
#     field :magnitude, Float, null: false
#     field :location, String, null: false
#     field :depth, Float, null: false
#     field :occurred_at, GraphQL::Types::ISO8601DateTime, null: true
#   end
# end


module Types
  class EarthquakeType < Types::BaseObject
    field :id, ID, null: false
    field :magnitude, Float, null: false
    field :location, String, null: false
    field :depth, Float, null: false
    field :occurred_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
