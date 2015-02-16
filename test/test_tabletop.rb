require 'minitest/autorun'
require './lib/tabletop'

class TestTabletop < Minitest::Test

  def setup
    @tabletop = Tabletop.new(0..5)
  end

  def test_move_piece_returns_cartesian_coords_of_new_location
    assert_equal [0,1], @tabletop.move_piece(0,0,"NORTH",1)
    assert_equal [0,3], @tabletop.move_piece(0,0,"NORTH",3)
    assert_equal [1,0], @tabletop.move_piece(0,0,"EAST",1)
    assert_equal [3,0], @tabletop.move_piece(0,0,"EAST",3)
    assert_equal [5,4], @tabletop.move_piece(5,5,"NORTH",-1)
    assert_equal [4,5], @tabletop.move_piece(5,5,"EAST",-1)
    assert_equal [5,4], @tabletop.move_piece(5,5,"SOUTH",1)
    assert_equal [4,5], @tabletop.move_piece(5,5,"WEST",1)
  end
  
  def test_move_piece_does_not_allow_moves_off_the_table
    assert_equal [0,0], @tabletop.move_piece(0,0,"NORTH",-1)
    assert_equal [0,0], @tabletop.move_piece(0,0,"SOUTH",1)
    assert_equal [5,5], @tabletop.move_piece(5,5,"NORTH",1)
    assert_equal [5,5], @tabletop.move_piece(5,5,"EAST",1)
  end

end
