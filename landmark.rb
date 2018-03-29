require 'set'

class Vehicle

	# initialize variables
	def initialize(landmarks, error)
		@landmarks = landmarks
		@error = error
		@points = Array.new(30, 0)
	end

	# move vehicle along path of landmarks
	def move

		# return if landmarks is in range or error variation is negative
		if !in_range || @error < 0
			ret_string = ""
				if !in_range && @error < 0
					ret_string = "Cannot Move: invalid set of landmarks and invalid error variation."
				elsif !in_range
					ret_string = "Cannot Move: invalid set of landmarks."
				else
					ret_string = "Cannot Move: invalid error variation."
				end

			puts ret_string
			return ret_string
		end

		# traverse points array from 1 to 30
		@points.each_with_index do |point, index|

			# assign 1 if sensor reads current point as included in error variation
			if readSensor(index)
				point = 1
				@points[index] = point
			end
		end
	end

	# read sensor at current index
	def readSensor(index)

		# get range at current index
		min = [1, index+1-@error].max
		max = [30, index+1+@error].min

		#puts "index: #{index}"
		#puts "min: #{min}"
		#puts "max: #{max}"

		# traverse range and check if landmarks includes point in range
		for i in min..max
			if @landmarks.include?(i)
				return true
			end
		end

		return false
	end

	# check if set contains any numbers out of range (1->30)
	def in_range
		range = Set[1, 2, 3, 4, 5,
								6, 7, 8, 9, 10,
							  11, 12, 13, 14, 15,
								16, 17, 18, 19, 20,
								21, 22, 23, 24, 25,
								26, 27, 28, 29, 30]

		if @landmarks.subset?(range)
			return true
		end

		return false
	end

	# print each element
	def print

		# return if landmarks is in range or error variation is negative
		if !in_range || @error < 0
			ret_string = ""
				if !in_range && @error < 0
					ret_string = "Cannot Print: invalid set of landmarks and invalid error variation."
				elsif !in_range
					ret_string = "Cannot Print: invalid set of landmarks."
				else
					ret_string = "Cannot Print: invalid error variation."
				end

			puts ret_string
			return ret_string
		end

		# print each point
		@points.each_with_index do |point, index|
			puts "#{index+1}: #{point}"
		end
	end
end
