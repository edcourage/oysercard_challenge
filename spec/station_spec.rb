require 'station'

describe Station do
  let(:station) {Station.new("liverpool_street_station",1)}

  context "#initialize" do

    it "when instance is created station name is saved" do
      expect(station.name).to eq "liverpool_street_station"
    end

    it "when instance is created station zone is saved" do
      expect(station.name).to eq "liverpool_street_station"
    end
  end
end
