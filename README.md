# Landmarks

Along a street, there are a set of landmarks. This set of landmarks are represented by distances from a 'start' reference point.

Landmarks are at points [5, 12, 18, 25]. Imagine a sensor attached to a vehicle moving along this street. The sensor can sense if a landmark is present or not with an error of +/- 1 points. For example, if there is a landmark at point 10, the sensor reports that a landmark is present at points 9, 10, 11.

If the vehicle moves from point 1 to point 30, populate an output list of size 30, where if the sensor detects that a landmark is present, it populates a 1 in the list else populates a 0. Print the output list.

# Running the script

To run the script on the command line, execute the main file with following command: ruby main.rb

This will instantiate a new Vehicle, which will move along the points 1 - 30, and then print 1 if the current point is within the error range, or 0 if the current point is not within the error range. The user can change the location of the landmarks in this file, as well as the error range, which are the arguments that are required when constructing a new Vehicle object.
