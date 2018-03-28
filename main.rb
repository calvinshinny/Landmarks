require_relative 'landmark.rb'
require 'set'

landmarks = Set[5, 12, 18, 25]
v = Vehicle.new(landmarks, 1)

v.move
v.print