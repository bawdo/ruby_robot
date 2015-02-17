# Overview
A simply robot that you can move around on a tabletop.

## Usage

A Robot is pretty useless without a place to move it about. Therefore
before using the #place method most other methods will do nothing.

Here is the basic life cycle of a robot:

- Create a robot.
- Place it on an arena with an initial location and facing.
- Move it about by turning it 'left' or 'right' and then issuing a 'move' command.

''NOTE'' Robots understand "NORTH", "SOUTH", "EAST" & "WEST" as valid facings.

See the 'Example irb session' below.

## Dependency

The Robot class depends on an arena that implements a 'move' method with the
following parameters.

```
#move(from_x,from_y,direction_of_travel,distance_to_travel = 1)
```

Valid directions of travel are "UP", "DOWN", "LEFT" and "RIGHT".

If the move is possible an array of the new x and y coordinates is returned.
If the move is not possible then an array of the starting x and y coordinates
is returned.

For example. #move(0,0,"UP",5) would determine if a move to 0,5 would be
possible. If so [0,5] would be returned, if not then [0,0] is returned.

If the distance_to_travel is a negative number you are affectively inverting
the direction_of_travel. For example both of the following are identical:

```ruby
tabletop.move(0,0,"UP",5)
tabletop.move(0,0,"DOWN",-5)
```

This allows items placed in the arena to "walk" backwards without chaning
their facing.

'Hint to implementers of arenas:' Think of an arena as a cartesian plane. Moving
"UP" along the 'Y' axis is done via addition to the starting 'Y', moving "DOWN"
would be a subtraction operation on the starting 'Y' axis. Accordingly, moving
"RIGHT" is achieved via addtion on the starting 'X' and moving "LEFT" would be
via a subtraction operation on the 'X' axis.


### Example irb session

~~~ruby
keith@R731 > irb
2.2.0 :001 > require './lib/robot'
=> true 
2.2.0 :002 > require './lib/tabletop'
=> true 
2.2.0 :003 > r = Robot.new
=> #<Robot:0x0000000227f1f8> 
2.2.0 :004 > r.place(Tabletop.new,3,3,"NORTH")
=> "NORTH" 
2.2.0 :005 > r.report
=> "3,3,NORTH" 
2.2.0 :006 > r.move
=> [3, 4] 
2.2.0 :007 > r.report
=> "3,4,NORTH" 
2.2.0 :008 > r.left
=> "WEST" 
2.2.0 :009 > r.report
=> "3,4,WEST" 
2.2.0 :010 > r.move
=> [2, 4] 
2.2.0 :011 > 
~~~

## TODO

- Rethink the Tabletop#move method name. #move does not move anything it
  simply lets one know if a move to that location is doable and what would the
  x,y coordinates be if it were.

- Create an example script show casing a Robot moving around a table.
