require 'set'
require_relative './cell'

class Board
  attr_accessor :live_cells

  def initialize(live_cells)
    @live_cells = Set.new live_cells
  end

  def self.new_board_from_coordinate_list(coords)
    new(coords.map do |c|
      coord = Coordinate.new *c
      Cell.new(coord, :alive)
    end)
  end

  def under_consideration
    @live_cells.inject(Set.new) do |consider, live_cell|
      consider.union live_cell.coordinate.neighbors
    end
  end

  def next
    self
  end
end
