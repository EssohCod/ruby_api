module Mutations
  class UpdateEarthquake < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :magnitude, Float, required: false
    argument :location, String, required: false
    argument :depth, Float, required: false

    field :earthquake, Types::EarthquakeType, null: true
    field :errors, [String], null: false

    def resolve(id:, magnitude: nil, location: nil, depth: nil)
      earthquake = Earthquake.find(id)
      if earthquake.update(magnitude: magnitude, location: location, depth: depth)
        { earthquake: earthquake, errors: [] }
      else
        { earthquake: nil, errors: earthquake.errors.full_messages }
      end
    end
  end
end
