#!/usr/bin/env ruby

require_relative '../lib/robot'
require_relative '../lib/tabletop'

robby = Robot.new
puts "Hello, my name is Robby. Robby, the ruby robot."

robby.place(Tabletop.new(0..5),3,3,"NORTH")

puts "I have just been placed in the very centre of a 5 x 5 square table and I'm ready to scoot about and see what is happening."

puts "Here is my current location and facing on the table: #{robby.report}"

printf("Robby please turn left and report back. %s\n",robby.left && robby.report)

puts "Robby please move 3 spaces."
robby.move
robby.move
robby.move
puts "Robby please report your location #{robby.report}."
puts "Robby please take one more step."
robby.move
puts "Robby report please #{robby.report}."
puts "Clever robby you refused to step off the table and stayed where you were."
