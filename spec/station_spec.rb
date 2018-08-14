require 'station'

describe Station do

  let(:station) { Station.new('Bank', 1) }

  describe '#zone' do

    it 'returns the name of the station' do
      expect(station.name).to eq 'Bank'
    end

    it 'returns the zone of the station' do
      expect(station.zone).to eq 1
    end

  end

end
