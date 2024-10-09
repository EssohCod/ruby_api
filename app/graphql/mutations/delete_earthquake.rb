# module Mutations
#   class DeleteEarthquake < BaseMutation
#     argument :input, Types::DeleteEarthquakeInput, required: true

#     # Specify the return fields for the mutation
#     field :success, Boolean, null: false
#     field :error, String, null: true

#     def resolve(input:)
#       # Access the ID from the input
#       earthquake_id = input[:id]

#       # Find the earthquake by ID
#       earthquake = Earthquake.find_by(id: earthquake_id)

#       if earthquake.nil?
#         # If not found, return an error message
#         {
#           success: false,
#           error: "Earthquake with ID #{earthquake_id} not found."
#         }
#       else
#         # If found, destroy the earthquake
#         earthquake.destroy

#         # Return success response
#         {
#           success: true,
#           error: nil
#         }
#       end
#     end
#   end
# end


module Mutations
  class DeleteEarthquake < Mutations::BaseMutation
    argument :id, ID, required: true

    field :earthquake, Types::EarthquakeType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      earthquake = Earthquake.find_by(id: id)
      return { earthquake: nil, errors: ['Earthquake not found'] } unless earthquake

      if earthquake.destroy
        { earthquake: earthquake, errors: [] }
      else
        { earthquake: nil, errors: earthquake.errors.full_messages }
      end
    end
  end
end