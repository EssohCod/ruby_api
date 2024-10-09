# module Mutations
#   class CreateEarthquake < Mutations::BaseMutation
#     argument :magnitude, Float, required: true
#     argument :location, String, required: true
#     argument :depth, Float, required: true

#     field :earthquake, Types::EarthquakeType, null: true
#     field :errors, [String], null: false

#     def resolve(magnitude:, location:, depth:)
#       earthquake = Earthquake.new(magnitude: magnitude, location: location, depth: depth)
#       if earthquake.save
#         { earthquake: earthquake, errors: [] }
#       else
#         { earthquake: nil, errors: earthquake.errors.full_messages }
#       end
#     end
#   end
# end


module Mutations
  class CreateEarthquake < BaseMutation
    argument :magnitude, Float, required: true
    argument :location, String, required: true
    argument :depth, Float, required: true
    argument :occurred_at, GraphQL::Types::ISO8601DateTime, required: true

    field :earthquake, Types::EarthquakeType, null: true
    field :errors, [String], null: false

    def resolve(magnitude:, location:, depth:, occurred_at:)
      earthquake = Earthquake.new(magnitude: magnitude, location: location, depth: depth, occurred_at: occurred_at)
      if earthquake.save
        { earthquake: earthquake, errors: [] }
      else
        { earthquake: nil, errors: earthquake.errors.full_messages }
      end
    end
  end
end
