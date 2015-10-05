require_relative '../lib/coordinate'

describe Coordinate do
  let(:x){rand(100_000)}
  let(:y){rand(100_000)}

  subject{ described_class.new x, y }

  it 'finds a set of neighbors'
  it 'has its own location' do
    expect(subject.x).to eq x
    expect(subject.y).to eq y
  end
end
