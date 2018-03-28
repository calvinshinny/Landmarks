require 'set'

class Vehicle

	def initialize(landmarks, error)

		@landmarks = landmarks
		@error = error
		@points = Array.new(30, 0)
	end

	def move

		@points.each_with_index do |point, index|
			if readSensor(index)
				point = 1
				@points[index] = point
			end
		end
	end

	def readSensor(index)

		min = [1, index+1-@error].max
		max = [30, index+1+@error].min
		#puts "new round"
		#puts "index: #{index}"
		#puts "min: #{min}"
		#puts "max: #{max}"
		for i in min..max
			#puts "i: #{i}"
			if @landmarks.include?(i)
				#puts "here"
				return true
			end
		end

		return false
	end

	def print

		@points.each_with_index do |point, index|
			puts "#{index+1}: #{point}"
		end
	end
end

#landmarks = Set[15]

#car = Vehicle.new(landmarks, 2)
#car.move
#car.print