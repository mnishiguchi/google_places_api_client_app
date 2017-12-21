require "rails_helper"

describe ApiClient::MapsService, :vcr do
  let(:client) { described_class.new }

  describe "directions" do
    it "return correct hash array" do
      routes = client.directions(
        "1600 Pennsylvania Ave NW, Washington, DC 20500, USA",
        "1700 Pennsylvania Ave NW, Washington, DC 20500, USA",
        mode: "driving",
        alternatives: false
      )

      expect(routes).to eq(
        [
          { bounds: { northeast: { lat: 38.9013535, lng: -77.03362080000001 },
                      southwest: { lat: 38.8976017, lng: -77.03963139999999 } },
            copyrights: "Map data ©2017 Google",
            legs: [
              { distance: { text: "0.8 mi", value: 1223 },
                duration: { text: "6 mins", value: 347 },
                end_address: "1700 Pennsylvania Ave NW, Washington, DC 20006, USA",
                end_location: { lat: 38.89888, lng: -77.03963139999999 },
                start_address: "1600 Pennsylvania Ave NW, Washington, DC 20500, USA",
                start_location: { lat: 38.8976017, lng: -77.0336341 },
                steps: [
                  { distance: { text: "0.3 mi", value: 416 },
                    duration: { text: "2 mins", value: 129 },
                    end_location: { lat: 38.9013403, lng: -77.03362080000001 },
                    html_instructions: "Head <b>north</b> on <b>15th St NW</b> toward <b>G St NW</b>",
                    polyline: { points: "_ellFdsduMqC@uA?Q@g@?wA?yB?IAK?qBAK?cBA" },
                    start_location: { lat: 38.8976017, lng: -77.0336341 },
                    travel_mode: "DRIVING" },
                  { distance: { text: "0.3 mi", value: 501 },
                    duration: { text: "2 mins", value: 124 },
                    end_location: { lat: 38.9013473, lng: -77.0394051 },
                    html_instructions: "Turn <b>left</b> onto <b>I St NW</b>",
                    maneuver: "turn-left",
                    polyline: { points: "k|llFbsduMBlCAt@CbKBjKC`@?lB?`@" },
                    start_location: { lat: 38.9013403, lng: -77.03362080000001 },
                    travel_mode: "DRIVING" },
                  { distance: { text: "0.2 mi", value: 290 },
                    duration: { text: "1 min", value: 83 },
                    end_location: { lat: 38.8988163, lng: -77.0394601 },
                    html_instructions: "Turn <b>left</b> onto <b>17th St NW</b>",
                    maneuver: "turn-left",
                    polyline: { points: "m|llFhweuM?PZ@`@?`AMR?l@?`@@\\?lC@z@?l@?" },
                    start_location: { lat: 38.9013473, lng: -77.0394051 },
                    travel_mode: "DRIVING" },
                  { distance: { text: "52 ft", value: 16 },
                    duration: { text: "1 min", value: 11 },
                    end_location: { lat: 38.89888, lng: -77.03963139999999 },
                    html_instructions: "Turn <b>right</b> onto <b>Pennsylvania Ave NW</b>"\
                      "<div style=\"font-size:0.9em\">Destination will be on the left</div>",
                    maneuver: "turn-right",
                    polyline: { points: "slllFrweuMK`@" },
                    start_location: { lat: 38.8988163, lng: -77.0394601 },
                    travel_mode: "DRIVING" }
                ],
                traffic_speed_entry: [],
                via_waypoint: [] }
            ],
            overview_polyline: { points: "_ellFdsduMgF@y@@gFA}BAcBABlCExLBjKC`@?nC?PZ@`@?`AM`A?hGBl@?K`@" },
            summary: "15th St NW and I St NW",
            warnings: [],
            waypoint_order: [] }
        ]
      )
    end
  end
end
