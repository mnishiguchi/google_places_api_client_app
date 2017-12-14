class GooglePlacesClient
  def initialize
    # https://github.com/qpowell/google_places
    @client = GooglePlaces::Client.new ENV["GOOGLE_MAPS_API_KEY"]
  end

  # Returns search results for schools in array of hashes.
  # Radius is in meters.
  def fetch_schools(lat:, lon:, radius: 10_000)
    results = @client.spots(lat, lon, types: [:school, :university], radius: radius)
    format_results_json(results)
  end

  # def fetch_place_details(place_id)
  #   @client.spot(place_id)
  # end
  #
  # def fetch_photo_url(place_id, max_width: 800)
  #   fetch_place_details(place_id).photos[0].fetch_url(max_width)
  # end

  private

  def format_results_json(results)
    results.map do |result|
      {
        name: result.name,
        place_id: result.place_id,
        reference: result.reference,
        types: result.types,
        formatted_address: result.formatted_address,
        lat: result.lat,
        lng: result.lng,
        viewport: result.viewport,
      }
    end
  end
end
