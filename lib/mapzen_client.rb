# https://github.com/mnishiguchi/geocoder
class MapzenClient
  SLICE_KEYS = %w[label neighbourhood city county state postal_code latitude longitude].freeze

  def autocomplete(q)
    return unless String(q).length > 1

    result = Geocoder.search(q, autocomplete: true)
    result&.data
  end

  def search(q, full: false)
    return unless String(q).length > 10

    result = Geocoder.search(q)
    full ? result&.data : format_result(result)
  end

  def reverse(latitude:, longitude:, full: false)
    result = Geocoder.search([latitude, longitude])
    full ? result&.data : format_result(result)
  end

  private

  # Returns an array of sliced hashes.
  def format_result(result, slice_keys = SLICE_KEYS)
    return unless result.is_a? Geocoder::Result::Mapzen

    slice_keys.map { |slice_key| [slice_key, result.send(slice_key)] }.to_h
  end
end
