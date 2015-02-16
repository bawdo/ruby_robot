class Tabletop

  attr_accessor :range

  def initialize(range = 0..5)
    @range = range
  end

  def valid_point?(x,y)
    range.include?(x) && range.include?(y)
  end

  def move_piece(starting_x,starting_y,direction_of_travel,distance_to_travel = 1)
    case direction_of_travel
    when "NORTH"
      landing_y = starting_y + distance_to_travel
      landing_x = starting_x
    when "SOUTH"
      landing_y = starting_y - distance_to_travel
      landing_x = starting_x
    when "EAST"
      landing_x = starting_x + distance_to_travel
      landing_y = starting_y
    when "WEST"
      landing_x = starting_x - distance_to_travel
      landing_y = starting_y
    else
      raise ArgumentError, "Unknown direction of travel. Must be one of #{valid_facings.to_join(',')}."
    end

    valid_point?(landing_x, landing_y) ? [landing_x, landing_y] : [starting_x,starting_y]
  end

end
