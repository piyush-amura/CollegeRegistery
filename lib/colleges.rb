require 'csv'
# Class College provides info. about college
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class College
  # class method that reads data from csv file
  #
  #
  # @return [Array] teachers object array
  #
  def self.all
    CSV.read('./colleges.csv')
  end

  # attribute writer method for class variable count
  #
  # @param [Integer] val value that needs to be assigned to @@constructor
  #
  # @return [Integer] @@count
  #
  def self.count=(val)
    @@count = val
  end

  # attribute reader method for class variable count
  #
  #
  # @return [Integer] @@count
  #
  def self.count
    @@count
  end

  @@count = College.all.size
  
  attr_accessor :id, :name, :courses, :students, :teachers

  # constructor method for College class
  #
  # @param [String] name     name of the college
  # @param [Array]  courses  Array of the course ids from Course class
  #
  def initialize(name, courses = [])
    @@count += 1
    @id = @@count
    @name = name
    @courses = courses
 end
end
