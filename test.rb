require_relative 'landmark'
require 'test/unit'
require 'set'

class TestLandmark < Test::Unit::TestCase

	# basic test with set of landmarks and error variation of 1
	def test_basic
		landmark = Set[7, 15, 25]
		vehicle = Vehicle.new(landmark, 1)
		vehicle.move

		res = [0, 0, 0, 0, 0,
			   1, 1, 1, 0, 0,
			   0, 0, 0, 1, 1,
			   1, 0, 0, 0, 0,
			   0, 0, 0, 1, 1,
			   1, 0, 0, 0, 0]

		assert_equal(vehicle.instance_variable_get(:@points), res)
	end

	# test a different error variation
	def test_diff_error_variation
		landmark = Set[7, 15, 25]
		vehicle = Vehicle.new(landmark, 2)
		vehicle.move

		res = [0, 0, 0, 0, 1,
			   1, 1, 1, 1, 0,
			   0, 0, 1, 1, 1,
			   1, 1, 0, 0, 0,
			   0, 0, 1, 1, 1,
			   1, 1, 0, 0, 0]

		assert_equal(vehicle.instance_variable_get(:@points), res)
	end

	# test overlapping error variation
	def test_diff_overlapping_error_variation
		landmark = Set[7, 15, 25]
		vehicle = Vehicle.new(landmark, 4)
		vehicle.move

		res = [0, 0, 1, 1, 1,
			   1, 1, 1, 1, 1,
			   1, 1, 1, 1, 1,
			   1, 1, 1, 1, 0,
			   1, 1, 1, 1, 1,
			   1, 1, 1, 1, 0]

		assert_equal(vehicle.instance_variable_get(:@points), res)
	end

	# test edges
	def test_edge_landmarks
		landmark = Set[1, 30]
		vehicle = Vehicle.new(landmark, 1)
		vehicle.move

		res = [1, 1, 0, 0, 0,
			   0, 0, 0, 0, 0,
			   0, 0, 0, 0, 0,
			   0, 0, 0, 0, 0,
			   0, 0, 0, 0, 0,
			   0, 0, 0, 1, 1]

		assert_equal(vehicle.instance_variable_get(:@points), res)
	end
end
