class Robot
  FACINGS = %w[NORTH EAST SOUTH WEST]

  attr_accessor :x, :y, :facing, :arena

  def place(arena, abcissa, ordinate, facing)
    return nil unless arena.valid_point?(abcissa,ordinate)
    @arena  = arena
    @x      = abcissa
    @y      = ordinate
    @facing = facing
  end

  def report
    "#{@x},#{@y},#{@facing}" if arena
  end

  def left
    return nil unless arena
    i = FACINGS.find_index(facing)
    @facing = (i == 0 ? FACINGS.last : FACINGS[i - 1])
  end
  
  def right
    return nil unless arena
    i = FACINGS.find_index(facing)
    @facing = (i == FACINGS.length - 1 ? FACINGS.first : FACINGS[i + 1])
  end

  def move
    return nil unless arena
    case facing
    when "NORTH"
      @x,@y = arena.move(x,y,"UP",1)
    when "EAST"
      @x,@y = arena.move(x,y,"RIGHT",1)
    when "SOUTH"
      @x,@y = arena.move(x,y,"DOWN",1)
    when "WEST"
      @x,@y = arena.move(x,y,"LEFT",1)
    end
  end

end
