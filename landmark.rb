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

	# print each element
	def print

		@points.each_with_index do |point, index|
			
			puts "#{index+1}: #{point}"
		end
	end
end
