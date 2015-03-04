#!/usr/bin/env ruby

require 'readline'
require_relative '../lib/robot'
require_relative '../lib/tabletop'

class RobotCommander

  attr_accessor :robot, :tabletop

  def initialize
    @robot    = Robot.new
    @tabletop = Tabletop.new
  end

  def completions(input)
    %w[PLACE REPORT LEFT RIGHT MOVE help exit].grep(/^#{input}/)
  end

  def main
    Readline.completion_proc = ->(input) {
      completions(input)
    }

    puts "\e[1;33mPress '?' or type 'help' for help or 'exit' to leave the arena.\e[0m"

    command = nil
    loop do
      command = Readline.readline("> ", true).strip
      break if command.nil? || command == 'exit'
      if robot.report.nil? && command !~ /PLACE/ && command !~ /help|\?/
        puts "\e[1;31m\You need to correctly PLACE your robot on the arena first\e[0m"
      else
        execute_command(command.strip)
      end
    end
  end

  def execute_command(command)
    case command
    when 'PLACE'
      robot.place(@tabletop,0,0,'NORTH')
      puts "\e[32mPlacing robot on the default location 0,0,'NORTH'\e[0m"
    when /PLACE\s+(\d)\s+(\d)\s+(\w+)/
      if robot.place(@tabletop,$1.to_i,$2.to_i,$3)
        puts "\e[32mPlacing robot on location #{$1},#{$2} facing #{$3}\e[0m"
      else
        puts "\e[1;31m\Failed to place robot at location #{$1},#{$2}\e[0m"
      end
    when 'REPORT'
      puts "\e[32mRobot is currently at location #{robot.report}\e[0m"
    when 'MOVE'
      current_location = robot.report
      robot.move
      if current_location == robot.report
        puts "\e[1;31m\Failed to move from #{robot.report}\e[0m"
      else
        puts "\e[32mMoved from #{current_location} to #{robot.report}\e[0m"
      end
    when 'LEFT'
      puts "\e[32mTurning #{command}, now facing #{robot.left}\e[0m"
    when 'RIGHT'
      puts "\e[32mTurning #{command}, now facing #{robot.right}\e[0m"
    when /help|\?/
      puts "\e[1;33mNOTE: All commands to the robot must be upper case. Commands to the console are lower case.\e[0m"
      puts "PLACE <x> <y> <FACING> - place the robot at location x,y on the arena"
      puts "REPORT                 - print the currnet coordinates of the robot's location"
      puts "LEFT                   - turn the robot left 90 degrees"
      puts "RIGHT                  - turn the robot right 90 degrees"
      puts "MOVE                   - move the robot one space forward"
      puts "help,?                 - display this help"
      puts "exit                   - leave the arena"
    else
      puts "\e[1;31mUnrecognised command. Try 'help' or '?'\e[0m"
    end 
  end
end

RobotCommander.new.main
