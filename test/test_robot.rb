require 'minitest/autorun'
require './lib/robot'
require './lib/tabletop'

class TestRobot < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_report_is_ignored_if_place_has_not_been_set
    assert_equal nil, @robot.report
  end

  def test_left_and_right_are_ignored_if_place_has_not_been_set
    assert_equal nil, @robot.left
    assert_equal nil, @robot.right
  end

  def test_move_is_ignored_if_place_has_not_been_set
    assert_equal nil, @robot.move
  end

  def test_place_sets_cartesian_coords_and_facing
    @robot.place(Tabletop.new,5,1,"NORTH")
    assert_equal 5, @robot.x
    assert_equal 1, @robot.y
    assert_equal "NORTH", @robot.facing
  end

  def test_placing_off_the_arena_is_not_possible
    assert_equal nil, @robot.place(Tabletop.new,6,6,"NORTH")
    assert_equal nil, @robot.place(Tabletop.new,0,6,"NORTH")
    assert_equal nil, @robot.place(Tabletop.new,6,0,"NORTH")
  end

  def test_report_returns_current_cartesian_coords_and_facing
    @robot.place(Tabletop.new,5,1,"NORTH")
    assert_equal "5,1,NORTH", @robot.report
  end

  def test_left_rotates_facing_by_90_degrees_to_the_left
    @robot.place(Tabletop.new,5,1,"NORTH")
    @robot.left
    assert_equal "WEST", @robot.facing
    @robot.left
    assert_equal "SOUTH", @robot.facing
    @robot.left
    assert_equal "EAST", @robot.facing
    @robot.left
    assert_equal "NORTH", @robot.facing
  end

  def test_right_rotates_facing_by_90_degrees_to_the_right
    @robot.place(Tabletop.new, 5,1,"NORTH")
    @robot.right
    assert_equal "EAST", @robot.facing
    @robot.right
    assert_equal "SOUTH", @robot.facing
    @robot.right
    assert_equal "WEST", @robot.facing
    @robot.right
    assert_equal "NORTH", @robot.facing
  end

end
