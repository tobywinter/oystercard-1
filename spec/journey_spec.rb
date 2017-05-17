require 'journey'
require 'oystercard'

describe Journey do
  subject(:journey) {described_class.new}
  let(:penalty_charge) {double :penalty_charge}
  it 'initializes with @penalty_charge' do
  expect(journey).to respond_to :penalty_charge
  end

  describe '#start_journey' do
    it 'should start a journey with a station'do
    station = Station.new("Bank", 1)
      expect(subject.start(station)).to change{subject.entry_station}.to eq("Bank")
      p subject.entry_station
    end

  end
end
