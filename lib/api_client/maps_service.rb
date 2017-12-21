# For available methods, see https://github.com/edwardsamuel/google-maps-services-ruby.
# Search results are an array of hashes.
module ApiClient
  class MapsService
    # Make all the client's methods available.
    delegate_missing_to :@client

    def initialize
      @client = ::GoogleMapsService::Client.new(
        key: ENV["GOOGLE_MAPS_API_KEY"],
        retry_timeout: 20, # Timeout for retrying failed request
        queries_per_second: 10 # Limit total request per second
      )
    end
  end
end
