# https://github.com/mnishiguchi/geocoder
module ApiClient
  class Mapzen
    SLICE_KEYS = %w[label neighbourhood city county state postal_code latitude longitude].freeze

    # Returns an array of place names.
    def autocomplete(q:)
      return unless String(q).length > 1

      result = Geocoder.search(q, autocomplete: true)
      result&.data
    end

    # Returns a hash of first result.
    def search(q:, raw: false)
      return unless String(q).length > 10

      result = Geocoder.search(q)
      raw ? result&.data : format_result(result)
    end

    # Returns a hash of first result.
    def reverse(latitude:, longitude:, raw: false)
      result = Geocoder.search([latitude, longitude])
      raw ? result&.data : format_result(result)
    end

    private

    # Returns an array of sliced hashes.
    def format_result(result, slice_keys: SLICE_KEYS)
      return unless result.is_a? Geocoder::Result::Mapzen

      slice_keys.map { |slice_key| [slice_key, result.send(slice_key)] }.to_h
    end
  end
end
