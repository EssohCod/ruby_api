
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
