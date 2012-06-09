require 'lib/models/rover'
#TODO need to handle multiple rovers
rover = Rover.new

rover.map_size
rover.initial_position
rover.instructions

rover.execute

puts "Final destination: " + rover.position
