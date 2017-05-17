require 'oystercard'

describe Oystercard do
let(:entry_station){ double :entry_station }
let(:exit_station){ double :exit_station }
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
    subject.top_up(described_class::MINIMUM_FARE)
    subject.touch_in(entry_station)
  end

  it 'raises an error when touching in a card with a balance of 0' do
    expect { subject.touch_in(entry_station) }.to raise_error ("Insufficient funds")
  end

  it 'remembers entry_station after touch in' do
    subject.top_up(described_class::MINIMUM_FARE)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq(entry_station)
  end
end

  describe '#touch_out' do
    subject(:card) {described_class.new}
    before do
      card.top_up(20)
      card.touch_in(entry_station)
    end

  it 'should reduce the balance by the minimum fare when touching out' do
    expect { card.touch_out(exit_station) }.to change{ card.balance }.by(-described_class::MINIMUM_FARE)
  end

  it 'should reset entry_station to nil' do
    card.touch_out(exit_station)
    expect(card.entry_station).to eq nil
  end

  it 'remembers exit_station after touch out' do
    card.touch_out(exit_station)
    expect(card.exit_station).to eq(exit_station)
  end

end

  describe '#in_journey?' do
    context "card has been touched_in" do
    subject(:card) {described_class.new}
    before do
      card.top_up(described_class::MINIMUM_FARE)
      card.touch_in(entry_station)
    end

    it 'returns true if a card is in use' do
      expect(card).to be_in_journey
    end

    it 'returns false if a card has been touched out' do
      card.touch_out(exit_station)
      expect(card).not_to be_in_journey
    end
  end

    it 'returns false when checking an unused card' do
      expect(subject).not_to be_in_journey
    end

  end

  describe '#journeys' do
      it 'has an empty list of jounreys be default' do
      expect(subject.journeys).to be_empty
    end

      it 'stores entry_station' do
        subject.top_up(described_class::MINIMUM_FARE)
        subject.touch_in(entry_station)
        expect(subject.journeys).to eq [{entry_station: entry_station}]
      end

      it 'stores exit_station' do
        subject.top_up(described_class::MINIMUM_FARE)
        subject.touch_in(entry_station)
        subject.touch_out(exit_station)
        expect(subject.journeys).to eq [{entry_station: entry_station, exit_station: exit_station}]
      end

  end

end
