require 'set'

class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def neighbors
    x_options = [x-1, x, x+1]
    y_options = [y-1, y, y+1]

    all_coords = Set.new(x_options.product y_options)
    all_coords.delete [x, y]
  end
end
