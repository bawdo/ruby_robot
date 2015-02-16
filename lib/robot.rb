class Robot
  FACINGS = %w[NORTH EAST SOUTH WEST]

  attr_accessor :x, :y, :facing, :arena

  def place(arena, abcissa, ordinate, facing)
    @arena  = arena
    @x      = abcissa  || 0
    @y      = ordinate || 0
    @facing = facing   || "NORTH"
  end

  def report
    "#{@x},#{@y},#{@facing}"
  end

  def left
    i = FACINGS.find_index(facing)
    @facing = (i == 0 ? FACINGS.last : FACINGS[i - 1])
  end
  
  def right
    i = FACINGS.find_index(facing)
    @facing = (i == FACINGS.length - 1 ? FACINGS.first : FACINGS[i + 1])
  end

  def move
    case facing
    when "NORTH"
      @x,@y = arena.move_piece(x,y,"UP",1)
    when "EAST"
      @x,@y = arena.move_piece(x,y,"RIGHT",1)
    when "SOUTH"
      @x,@y = arena.move_piece(x,y,"DOWN",1)
    when "WEST"
      @x,@y = arena.move_piece(x,y,"LEFT",1)
    end
  end

end
