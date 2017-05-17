require 'station'

describe Station do
  let(:name){ double :name }
  let(:zone){ double :zone }
  subject(:station) {described_class.new(name, zone)}

  it 'initializes with @name' do
    expect(station).to respond_to :name
  end

  it 'initializes with @zone' do
    expect(station).to respond_to :zone
  end
end
