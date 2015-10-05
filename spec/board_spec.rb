require_relative '../lib/board'

describe Board do
  it 'has a set of live cells' do
    expect(square_board.live_cells).to be_a Set
    expect(square_board.live_cells.length).to eq 4
    square_board.live_cells.each do |c|
      expect(c).to be_a Cell
    end
  end

  it 'has a set of cells under consideration' do
    expect(blank_board.under_consideration.length).to eq 0
    expect(square_board.under_consideration.length).to eq 16
    expect(blinker_board.under_consideration.length).to eq 15
    expect(blonker_board.under_consideration.length).to eq 15
  end
  it 'iterates a blank board correctly' do
    expect(blank_board.next).to eq blank_board
  end
  it 'iterates a block correctly' do
    expect(square_board.next).to eq square_board
  end
  it 'iterates a blinker correctly' do
    expect(blinker_board.next).to eq blonker_board
    expect(blonker_board.next).to eq blinker_board
  end


  let(:square_board) do
    described_class.new_board_from_coordinate_list([
      [0,0], [1,0],
      [0,1], [1,1]
      ])
  end

  let(:blank_board) do
    described_class.new_board_from_coordinate_list([])
  end

  let(:blinker_board) do
    described_class.new_board_from_coordinate_list([
      [-1, 0], [0, 0], [1, 0]
      ])
  end

  let(:blonker_board) do
    described_class.new_board_from_coordinate_list([
      [0, -1], [0, 0], [0, 1]
      ])
  end
end
