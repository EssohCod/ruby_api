
module Types
  class QueryType < Types::BaseObject
    # Fetch all earthquakes with pagination and filtering options
    field :earthquakes, [Types::EarthquakeType], null: false, description: "Fetches a paginated list of earthquakes." do
      argument :page, Integer, required: false, description: "The page number for pagination."
      argument :per_page, Integer, required: false, description: "The number of records per page."
      argument :magnitude_greater_than, Float, required: false, description: "Filter by magnitude greater than."
    end

    # Method to resolve earthquakes
    def earthquakes(page: 1, per_page: 20, magnitude_greater_than: nil)
      scope = Earthquake.all
      scope = scope.where('magnitude > ?', magnitude_greater_than) if magnitude_greater_than
      scope.page(page).per(per_page)
    end

    # New field to fetch a specific earthquake by ID
    field :earthquake, Types::EarthquakeType, null: true do
      argument :id, ID, required: true, description: "The ID of the earthquake to fetch."
    end

    # Method to resolve a single earthquake by ID
    def earthquake(id:)
      Earthquake.find_by(id: id) || GraphQL::ExecutionError.new("Earthquake not found")
    end
  end
end
