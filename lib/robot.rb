class Robot

  attr_accessor :x, :y, :facing
  attr_reader   :range

  def place(abcissa, ordinate, facing)
    @x      = abcissa
    @y      = ordinate
    @facing = facing
    @range  = 0..5
  end

  def report
    "#{@x},#{@y},#{@facing}"
  end

  def left
    case facing
    when "NORTH"
      @facing = "WEST"
    when "WEST"
      @facing = "SOUTH"
    when "SOUTH"
      @facing = "EAST"
    when "EAST"
      @facing = "NORTH"
    end
  end

  def right
    case facing
    when "NORTH"
      @facing = "EAST"
    when "EAST"
      @facing = "SOUTH"
    when "SOUTH"
      @facing = "WEST"
    when "WEST"
      @facing = "NORTH"
    end
  end

  def move
    case facing
    when "NORTH"
      next_y = y + 1
      next_x = x
    when "SOUTH"
      next_y = y - 1
      next_x = x
    when "EAST"
      next_x = x + 1
      next_y = y
    when "WEST"
      next_x = x - 1
      next_y = y
    end
    if next_move_is_valid?(next_x,next_y)
      @x = next_x
      @y = next_y 
    end
    report
  end

  private

  def next_move_is_valid?(next_x,next_y)
    range.include?(next_x) && range.include?(next_y)
  end

end
