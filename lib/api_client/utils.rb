# A set of utilities that are commonly used for handling geo data derived from apis.
module ApiClient
  module Utils
    def encode_points(points)
      Polylines::Encoder.encode_points(points)
    end

    def decode_polyline(points)
      format_points(Polylines::Decoder.decode_polyline(points))
    end

    def format_float(float, ndigits = 7)
      float.to_f.round(ndigits)
    end

    def format_float_array(float_array, ndigits = 7)
      float_array.map { |float| format_float(float, ndigits) }
    end

    def format_points(points, ndigits = 7)
      points.map { |point| format_float_array(point, ndigits) }
    end
  end
end
