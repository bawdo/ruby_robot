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

  # Convenience method wrapping #move_piece to make moving up a little easier.
  def move_piece_up(from_x,from_y, distance_to_travel = 1)
    move_piece(from_x,from_y, "UP", distance_to_travel = 1)
  end

  # Convenience method wrapping #move_piece to make moving down a little easier.
  def move_piece_down(from_x,from_y, distance_to_travel = 1)
    move_piece(from_x,from_y, "DOWN", distance_to_travel = 1)
  end

  # Convenience method wrapping #move_piece to make moving left a little easier.
  def move_piece_left(from_x,from_y, distance_to_travel = 1)
    move_piece(from_x,from_y, "LEFT", distance_to_travel = 1)
  end

  # Convenience method wrapping #move_piece to make moving right a little easier.
  def move_piece_right(from_x,from_y, distance_to_travel = 1)
    move_piece(from_x,from_y, "RIGHT", distance_to_travel = 1)
  end

end
