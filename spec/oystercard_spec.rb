require 'oystercard'

describe Oystercard do

  it "should return a balance of zero when first initialized" do
    expect(subject.balance).to eq 0
  end

end
