class Tabletop

  attr_accessor :range

  def initialize(range = 0..5)
    @range = range
  end

  def valid_point?(x,y)
    range.include?(x) && range.include?(y)
  end

  def move_piece(from_x,from_y,direction_of_travel,distance_to_travel = 1)
    case direction_of_travel
    when "UP"
      to_y = from_y + distance_to_travel
      to_x = from_x
    when "DOWN"
      to_y = from_y - distance_to_travel
      to_x = from_x
    when "LEFT"
      to_x = from_x - distance_to_travel
      to_y = from_y
    when "RIGHT"
      to_x = from_x + distance_to_travel
      to_y = from_y
    else
      raise ArgumentError, "Unknown direction of travel. Valid directions are 'UP','DOWN','LEFT', or 'RIGHT'"
    end

    valid_point?(to_x, to_y) ? [to_x, to_y] : [from_x,from_y]
  end

end
