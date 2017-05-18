require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) {described_class.new}
  let(:penalty_charge) {double :penalty_charge}
  station1 = Station.new("Bank", 1)
  station2 = Station.new("Kingston", 6)

  it 'initializes with @penalty_charge' do
  expect(journey).to respond_to :penalty_charge
  end

  describe '#start' do
    it 'should start a journey with a station' do
      expect{ journey.start(station1) }.to change{ journey.entry_station }.to eq("Bank")
    end

    it 'should start a journey with a zone' do
      expect{ journey.start(station1) }.to change{ journey.entry_zone }.to eq(1)
    end
  end

  describe '#end' do
    it 'should end a journey with a station' do
      expect{ journey.end(station2) }.to change{ journey.exit_station }.to eq("Kingston")
    end

    it 'should end a journey with a zone' do
      expect{ journey.end(station2) }.to change{ journey.exit_zone }.to eq(6)
    end
  end

  describe '#zones_travelled?' do
    before do
      journey.start(station1)
      journey.end(station2)
    end
    it 'should calculate how many zones the journey spanned' do
      expect{ journey.zones_travelled? }.to change{ journey.travelled }.to 6
    end
  end
end
