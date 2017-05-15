require 'oystercard'

describe Oystercard do

  it "should return a balance of zero when first initialized" do
    expect(subject.balance).to eq 0
  end

  it "should add 100 to the balance when we top up 100" do
  subject.top_up(100)
  expect(subject.balance).to eq 100
  end
end
