require "rails_helper"

describe ApiClient::Utils do
  class TestClass
    include ApiClient::Utils
  end

  let(:test_object) { TestClass.new }

  describe "encode_points" do
    it "returns correct polyline string" do
      points = [[38.95871, -77.357], [38.95871, -77.35689]]
      expect(test_object.encode_points(points)).to eq("}bxlFfxcwM?U")
    end
  end

  describe "decode_polyline" do
    it "returns correst points" do
      polyline = "}bxlFfxcwM?U"
      expect(test_object.decode_polyline(polyline)).to eq([[38.95871, -77.357], [38.95871, -77.35689]])
    end
  end

  describe "format_float" do
    it "return correctly formated float" do
      expect(test_object.format_float(38.9552586000001)).to eq(38.9552586)
      expect(test_object.format_float(38.9552586999999)).to eq(38.9552587)
    end
  end

  describe "format_float_array" do
    subject do
      float_array = [38.9552586000001, 38.9552586999999]
      test_object.format_float_array(float_array)
    end

    it "return correctly formated float array" do
      expect(subject).to eq([38.9552586, 38.9552587])
    end
  end

  describe "format_points" do
    subject do
      float_points = [[38.9644712000001, -77.38293639999999], [38.9695549000001, -77.38614249999999]]
      test_object.format_points(float_points)
    end

    it "return correctly formated float points" do
      expect(subject).to eq([[38.9644712, -77.3829364], [38.9695549, -77.3861425]])
    end
  end
end
