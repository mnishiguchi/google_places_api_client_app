# https://wiki.openstreetmap.org/wiki/Nominatim
class NominatimClient
  include GeoHelper

  SEARCH_URL = "http://nominatim.openstreetmap.org/search.php".freeze
  DEFAULT_QUERY = { countrycodes: "us", polygon: 1, format: "json", limit: 1 }.freeze
  SLICE_KEYS = %w[place_id boundingbox polygonpoints lat lon display_name type].freeze

  def search(params, slice_keys = SLICE_KEYS)
    response = HTTParty.get(SEARCH_URL, query: DEFAULT_QUERY.merge(params)).response
    JSON.parse(response.body).map do |result_hash|
      transform_result_hash(result_hash).slice(*slice_keys)
    end
  end

  private

  def transform_result_hash(result_hash)
    unless result_hash["polygonpoints"].nil?
      points = format_points(result_hash["polygonpoints"].map(&:reverse))
      result_hash["polygonpoints"] = encode_points(points)
    end

    unless result_hash["lat"].nil?
      result_hash["lat"] = format_float(result_hash["lat"])
    end

    unless result_hash["lon"].nil?
      result_hash["lon"] = format_float(result_hash["lon"])
    end

    unless result_hash["boundingbox"].nil?
      result_hash["boundingbox"] = format_float_array(result_hash["boundingbox"])
    end

    unless result_hash["display_name"].nil?
      result_hash["display_name"] = result_hash["display_name"].remove(/, United States of America\z/)
    end

    result_hash
  end
end
