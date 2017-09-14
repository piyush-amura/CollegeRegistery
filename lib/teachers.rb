require 'csv'
require_relative 'persons'
# Class Teacher provides info about teachers and
# inherits attributes from Person class
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Teacher < Person
  # class method that reads data from csv file
  #
  #
  # @return [Array] teachers object array
  #
  def self.all
    CSV.read('./teachers.csv')
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

  @@count = Teacher.all.size

  attr_accessor :college_id, :courses

  # constructor method for Teacher class
  #
  # @param [String] name  name of the teacher
  # @param [String] college_id id of the college where teacher belong
  # @param [Integer] courses courses information of the teacher
  #
  def initialize(name, college_id,courses)
    @@count += 1
    @college_id = college_id
    @course = courses
    super(@@count, name)
  end
end
