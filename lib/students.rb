require_relative 'persons'
require 'csv'

# Class Student provides info about students
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Student < Person
  # class method that reads data from csv file
  #
  #
  # @return [Array] teachers object array
  #
  def self.all
    CSV.read('./students.csv')
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
  
  attr_accessor :college_id, :course_id

  @@count = Student.all.size

  # constructor for student class
  #
  # @param [String]  name 			 name of the student
  # @param [Integer] college_id  id of the college student is enrolled
  # @param [Integer] course_id   id of the course student is enrolled in
  #
  def initialize(name, college_id, course_id)
    @@count += 1
    @college_id = college_id
    @course_id  = course_id
    super(@@count, name)
  end
end
