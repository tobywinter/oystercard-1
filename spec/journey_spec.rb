require 'journey'

describe Journey do
  subject(:journey) {described_class.new}
  let(:penalty_charge) {double :penalty_charge}
  it 'initializes with @penalty_charge' do
  expect(journey).to respond_to :penalty_charge
  end
end
