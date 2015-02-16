require 'minitest/autorun'
require './lib/robot'
require './lib/tabletop'

class TestRobot < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_place_sets_cartesian_coords_and_facing
    @robot.place(Tabletop.new,5,1,"NORTH")
    assert_equal 5, @robot.x
    assert_equal 1, @robot.y
    assert_equal "NORTH", @robot.facing
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
