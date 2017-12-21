require "rails_helper"

describe ApiClient::Mapzen, :vcr do
  let(:client) { described_class.new }

  describe "#autocomplete" do
    it "return an array of place names" do
      search = client.autocomplete(q: "Alexandria, Virginia")

      expect(search).to eq([
                             "Alexandria, VA",
                             "City of Alexandria, VA",
                             "Alexandria West, Alexandria, VA",
                             "New Alexandria, VA"
                           ])
    end
  end

  describe "#search" do
    it "return a formatted hash of first result" do
      search = client.search(q: "Alexandria, Virginia")

      expect(search).to eq(
        "city" => "Alexandria",
        "county" => "City of Alexandria",
        "label" => "Alexandria, VA, USA",
        "latitude" => 38.836368,
        "longitude" => -77.049221,
        "neighbourhood" => nil,
        "postal_code" => nil,
        "state" => "Virginia"
      )
    end

    it "return a raw hash of first result" do
      search = client.search(q: "Alexandria, Virginia", raw: true)

      expect(search).to eq(
        "bbox" => [-77.1443613231, 38.785223763, -77.0372902895, 38.845018774],
        "geometry" => { "type" => "Point", "coordinates" => [-77.049221, 38.836368] },
        "properties" => {
          "id" => "101728581",
          "gid" => "whosonfirst:locality:101728581",
          "layer" => "locality",
          "source" => "whosonfirst",
          "source_id" => "101728581",
          "name" => "Alexandria",
          "confidence" => 1,
          "match_type" => "exact",
          "accuracy" => "centroid",
          "country" => "United States",
          "country_gid" => "whosonfirst:country:85633793",
          "country_a" => "USA",
          "region" => "Virginia",
          "region_gid" => "whosonfirst:region:85688747",
          "region_a" => "VA",
          "county" => "City of Alexandria",
          "county_gid" => "whosonfirst:county:102080641",
          "locality" => "Alexandria",
          "locality_gid" => "whosonfirst:locality:101728581",
          "continent" => "North America",
          "continent_gid" =>  "whosonfirst:continent:102191575",
          "label" => "Alexandria, VA, USA"
        },
        "type" => "Feature"
      )
    end
  end

  describe "#reverse" do
    it "return an array of place names" do
      search = client.reverse(latitude: 38.836368, longitude: -77.049221)

      expect(search).to eq(
        "city" => "Alexandria",
        "county" => "City of Alexandria",
        "label" => "Potomac Yard North, Alexandria, VA, USA",
        "latitude" => 38.836363,
        "longitude" => -77.049277,
        "neighbourhood" => "Potomac Yard North",
        "postal_code" => nil,
        "state" => "Virginia"
      )
    end
  end
end
