# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



# require 'faker'

# 3000.times do
#   Earthquake.create!(
#     magnitude: rand(1.0..9.0),
#     location: Faker::Address.city,
#     depth: rand(0.0..700.0)
#   )
# end

# puts "Created 3000 earthquake entries"


require 'net/http'
require 'json'

# USGS Earthquake Data API
url = 'https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&limit=1000'
uri = URI(url)
response = Net::HTTP.get(uri)
earthquakes_data = JSON.parse(response)["features"]

earthquakes_data.each do |earthquake|
  properties = earthquake["properties"]
  Earthquake.create!(
    magnitude: properties["mag"],
    location: properties["place"],
    depth: earthquake["geometry"]["coordinates"][2]
  )
end

puts "Created #{earthquakes_data.length} earthquake entries from the USGS API"
