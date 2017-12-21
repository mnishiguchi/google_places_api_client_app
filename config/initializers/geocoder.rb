# https://github.com/alexreisner/geocoder#geocoding-service-lookup-configuration
# https://github.com/alexreisner/geocoder/blob/master/lib/geocoder/configuration.rb
# https://github.com/alexreisner/geocoder/tree/master/lib/geocoder/lookups
Geocoder.configure(
  language: :en,              # ISO-639 language code
  use_https: false,           # use HTTPS for lookup requests? (if supported)
  http_proxy: nil,            # HTTP proxy server (user:pass@host:port)
  https_proxy: nil,           # HTTPS proxy server (user:pass@host:port)

  # Geocoding service
  timeout: 3,                 # geocoding service timeout (secs)
  lookup: :mapzen,            # name of geocoding service (symbol)
  api_key: ENV["MAPZEN_API_KEY"], # API key for geocoding service

  # IP address geocoding service
  ip_lookup: :freegeoip, # name of IP address geocoding service (symbol)

  # Caching
  cache: ENV["REDIS_URL"] && Redis.new,  # cache object (must respond to #[], #[]=, and #del)
  cache_prefix: "geocoder:",             # prefix (string) to use for all cache keys

  # Exceptions that should not be rescued by default
  # (if you want to implement custom error handling);
  # supports SocketError and Timeout::Error
  # always_raise: [],

  # Calculation options
  units: :mi,                 # :km for kilometers or :mi for miles
  distances: :spherical       # :spherical or :linear
)
