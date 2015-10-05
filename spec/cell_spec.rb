require_relative '../lib/cell'

describe Cell do
  let(:coordinate){ Coordinate.new 0, 0 }
  subject{ described_class.new coordinate, :alive }

  it 'has a coordinate' do
    expect(subject.coordinate).to eq coordinate
  end

  describe 'when alive' do
    [0, 1, 4, 5, 6, 7, 8].each do |live_neighbors|
      it "dies with #{live_neighbors} live neighbors" do
        expect(subject.next(live_neighbors)).to_not be_alive
      end
    end

    [2, 3].each do |live_neighbors|
      it "lives with #{live_neighbors} live neighbors" do
        expect(subject.next(live_neighbors)).to be_alive
      end
    end
  end

  describe 'when dead' do
    subject{ described_class.new coordinate, :dead }

    [0, 1, 2, 4, 5, 6, 7, 8].each do |live_neighbors|
      it "dies with #{live_neighbors} live neighbors" do
        expect(subject.next(live_neighbors)).to_not be_alive
      end
    end

    it "lives with 3 live neighbors" do
      expect(subject.next(3)).to be_alive
    end
  end
end
