require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) {described_class.new}
  let(:penalty_charge) {double :penalty_charge}
  it 'initializes with @penalty_charge' do
  expect(journey).to respond_to :penalty_charge
  end

  describe '#start' do
    station = Station.new("Bank", 1)

    it 'should start a journey with a station' do
      expect{ journey.start(station) }.to change{ journey.entry_station }.to eq("Bank")
    end

    it 'should start a journey with a zone' do
      expect{ journey.start(station) }.to change{ journey.entry_zone }.to eq(1)
    end
  end

  describe '#end' do
    station = Station.new("Kingston", 6)

    it 'should end a journey with a station' do
      expect{ journey.end(station) }.to change{ journey.exit_station }.to eq("Kingston")
    end

    it 'should end a journey with a zone' do
      expect{ journey.end(station) }.to change{ journey.exit_zone }.to eq(6)
    end
  end
end
