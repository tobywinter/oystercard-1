require 'oystercard'

describe Oystercard do

  it "should return a balance of zero when first initialized" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it "should add x to the balance when we top up x" do
      subject.top_up(described_class::MINIMUM_FARE)
      expect(subject.balance).to eq(described_class::MINIMUM_FARE)
    end

    it "should raise error if balance exceeds 90" do
      if subject.balance > described_class::MAXIMUM_BALANCE
      expect { subject.top_up(described_class::MINIMUM_FARE) }.to raise_error ("Balance has exceeded limit of #{described_class::LIMIT}")
      end
    end
  end

  describe '#touch_in' do
    it "card is aware that it's been touched in" do
    entry_station = double :entry_station
    subject.top_up(described_class::MINIMUM_FARE)
    subject.touch_in(entry_station)
    expect(subject.in_journey).to eq true
  end

  it 'raises an error when touching in a card with a balance of 0' do
    entry_station = double :entry_station
    expect { subject.touch_in(entry_station) }.to raise_error ("Insufficient funds")
  end

  it 'remembers entry entry_station after touch in' do
    entry_station = double :entry_station
    subject.top_up(described_class::MINIMUM_FARE)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq(entry_station)
  end
end

  describe '#touch_out' do
   it "is aware that it's been touched out" do
    subject.touch_out
    expect(subject.in_journey).to eq false
  end

  it 'should reduce the balance by the minimum fare when touching out' do
    expect { subject.touch_out }.to change{ subject.balance }.by(-described_class::MINIMUM_FARE)
  end
end

  describe '#in_journey?' do
    it 'returns true if a card is in use' do
      entry_station = double :entry_station
      subject.top_up(described_class::MINIMUM_FARE)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it 'returns false if a card has been touched out' do
      entry_station = double :entry_station
      subject.top_up(described_class::MINIMUM_FARE)
      subject.touch_in(entry_station)
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'returns false when checking an unused card' do
      expect(subject).not_to be_in_journey
    end

  end

end
