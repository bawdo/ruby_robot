require 'minitest/autorun'
require './lib/robot'

class TestRobot < Minitest::Test
  def setup
    @robot = Robot.new
  end

  def test_place_sets_cartesian_coords_and_facing
    @robot.place(5,1,"NORTH")
    assert_equal 5, @robot.x
    assert_equal 1, @robot.y
    assert_equal "NORTH", @robot.facing
  end

  def test_report_returns_current_cartesian_coords_and_facing
    @robot.place(5,1,"NORTH")
    assert_equal "5,1,NORTH", @robot.report
  end

  def test_left_rotates_facing_by_90_degrees_to_the_left
    @robot.place(5,1,"NORTH")
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
    @robot.place(5,1,"NORTH")
    @robot.right
    assert_equal "EAST", @robot.facing
    @robot.right
    assert_equal "SOUTH", @robot.facing
    @robot.right
    assert_equal "WEST", @robot.facing
    @robot.right
    assert_equal "NORTH", @robot.facing
  end

  def test_move_moves_robot_one_space_in_facing_direction
    @robot.place(3,3,"NORTH")
    @robot.move
    assert_equal "3,4,NORTH", @robot.report
    @robot.place(3,3,"SOUTH")
    @robot.move
    assert_equal "3,2,SOUTH", @robot.report
    @robot.place(3,3,"EAST")
    @robot.move
    assert_equal "4,3,EAST", @robot.report
    @robot.place(3,3,"WEST")
    @robot.move
    assert_equal "2,3,WEST", @robot.report
  end

  def test_movements_off_of_the_table_are_ignored
    @robot.place(5,5,"NORTH")
    @robot.move
    assert_equal "5,5,NORTH", @robot.report
  end

end
