require 'minitest/autorun'
require './lib/tabletop'

class TestTabletop < Minitest::Test

  def setup
    @tabletop = Tabletop.new(0..5)
  end

  def test_move_returns_cartesian_coords_of_new_location
    assert_equal [0,1], @tabletop.move(0,0,"UP",1)
    assert_equal [0,3], @tabletop.move(0,0,"UP",3)
    assert_equal [1,0], @tabletop.move(0,0,"RIGHT",1)
    assert_equal [3,0], @tabletop.move(0,0,"RIGHT",3)
    assert_equal [5,4], @tabletop.move(5,5,"UP",-1)
    assert_equal [4,5], @tabletop.move(5,5,"RIGHT",-1)
    assert_equal [5,4], @tabletop.move(5,5,"DOWN",1)
    assert_equal [4,5], @tabletop.move(5,5,"LEFT",1)
  end

  def test_move_does_not_allow_moves_off_the_table
    assert_equal [0,0], @tabletop.move(0,0,"UP",-1)
    assert_equal [0,0], @tabletop.move(0,0,"DOWN",1)
    assert_equal [5,5], @tabletop.move(5,5,"UP",1)
    assert_equal [5,5], @tabletop.move(5,5,"RIGHT",1)
  end

end
