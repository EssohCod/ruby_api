module Types
  class DeleteEarthquakeInput < BaseInputObject
    argument :id, ID, required: true, description: "ID of the earthquake to delete"
  end
end
