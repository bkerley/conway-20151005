class Cell
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def survives(neighbors)
    return next_state_when_alive(neighbors) if @state == :alive
    return next_state_when_dead(neighbors)
  end

  def next(neighbors)
    next_state = survives neighbors
    self.class.new next_state
  end

  def alive?
    state == :alive
  end

  def next_state_when_alive(neighbors)
    case neighbors
    when 2
      :alive
    when 3
      :alive
    else
      :dead
    end
  end

  def next_state_when_dead(neighbors)
    return :alive if neighbors == 3
    return :dead
  end
end
