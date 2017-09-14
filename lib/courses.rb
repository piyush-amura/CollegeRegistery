require 'csv'
# Class Course provides course related Information
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Course
  # class method that reads data from csv file
  #
  #
  # @return [Array] teachers object array
  #
  def self.all
    CSV.read('./courses.csv')
  end

  @@count = Course.all.size
  
  attr_accessor :id, :name

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
  # constructor method for Course class instatntiation
  #
  # @param [String] name name of the Course
  #
  def initialize(name)
    @@count += 1
    @id = @@count
    @name = name
  end
end
