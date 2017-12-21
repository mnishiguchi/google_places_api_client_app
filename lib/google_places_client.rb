# https://github.com/qpowell/google_places
# Search results are an array of GooglePlaces::Spot objects.
# For array of hashes, call `#as_json` or `.format_spots`.
class GooglePlacesClient
  # Make all the client's methods available.
  delegate_missing_to :@client

  SLICE_KEYS = %w[name lat lng types vicinity].freeze

  def initialize
    @client = GooglePlaces::Client.new ENV["GOOGLE_MAPS_API_KEY"]
  end

  class << self
    # Converts an array of GooglePlaces::Spot into an array of sliced hashes.
    def format_spots(spots, slice_keys = SLICE_KEYS)
      return unless spots.first.is_a? GooglePlaces::Spot

      spots.map do |spot|
        slice_keys.map { |slice_key| [slice_key, spot.send(slice_key)] }.to_h
      end
    end
  end
end
