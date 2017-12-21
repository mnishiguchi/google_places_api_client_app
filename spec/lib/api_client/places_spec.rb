require "rails_helper"

describe ApiClient::Places, :vcr do
  let(:client) { described_class.new }

  describe "spots" do
    it "return array of GooglePlaces::Spot objects" do
      spots = fetch_spots(client)

      expect(spots).to be_a Array
      expect(spots.first).to be_a ::GooglePlaces::Spot
    end
  end

  describe ".format_spots" do
    it "returns array of formatted hashes" do
      spots = fetch_spots(client)
      formatted_spots = described_class.format_spots(spots)

      expect(formatted_spots).to eq(
        [
          { "name" => "Wok and Roll",
            "lat" => 38.9207482,
            "lng" => -77.0422219,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2400 18 Street Northwest, Washington" },
          { "name" => "Pizza Citi",
            "lat" => 38.9207092,
            "lng" => -77.0416971,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2341 18 Street Northwest, Washington" },
          { "name" => "Jumbo Slice",
            "lat" => 38.9207051,
            "lng" => -77.0416911,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2341 18th St NW, Washington" },
          { "name" => "Roxanne Restaurant",
            "lat" => 38.9202142,
            "lng" => -77.0415488,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2319 18 Street Northwest, Washington" },
          { "name" => "Amsterdam Falafelshop",
            "lat" => 38.9211625,
            "lng" => -77.04195530000001,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2425 18 Street Northwest, Washington" },
          { "name" => "#1 Juicy Cajun Seafood",
            "lat" => 38.9212229,
            "lng" => -77.0424735,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2418 18 Street Northwest, Washington" },
          { "name" => "Cuba Cuba",
            "lat" => 38.9200014,
            "lng" => -77.0414555,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2309 18 Street Northwest, Washington" },
          { "name" => "Zenebech Injera Restaurant",
            "lat" => 38.9212949,
            "lng" => -77.0424689,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2420 18 Street Northwest, Washington" },
          { "name" => "Los Cuates Restaurant Adams Morgan",
            "lat" => 38.92127509999999,
            "lng" => -77.0419159,
            "types" => %w[restaurant food point_of_interest establishment],
            "vicinity" => "2429 18 Street Northwest, Washington" }
        ]
      )
    end
  end

  private

  def fetch_spots(client)
    client.spots(
      latitude: 38.92044,
      longitude: -77.042324,
      options:  { types: %w[restaurant],
                  exclude: %w[bar bakery convenience_store],
                  rankby: "distance" }
    )
  end
end
