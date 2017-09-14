require_relative 'persons'
require 'csv'

# Class Student provides info about students
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Student < Person
  attr_accessor :college_id, :course_id
  @@count=0
  def initialize(name, college_id,course_id)
    @@count += 1
    @college_id = college_id
    @course_id  = course_id
    super(@@count, name)
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

  # class method that reads data from csv file
  #
  #
  # @return [Array] teachers object array
  #
  def self.all
    CSV.read('./students.csv')
  end
end
