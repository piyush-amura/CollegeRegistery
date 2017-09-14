require 'csv'
# Class College provides info. about college
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class College
  @@count = 0
  attr_accessor :id, :name, :courses, :students, :teachers

  # constructor method for College class
  #
  # @param [String] name     name of the college
  # @param [Array]  courses  Array of the course ids from Course class
  # @param [Array]  teachers Array of the teacher ids from Teacher class
  # @param [Array]  students Array of the student ids from Student class
  #
  def initialize(name, courses = nil, teachers = nil, students = nil)
    @@count += 1
    @id = @@count
    @name = name
    @courses  = courses
    @students = teachers
    @teachers = students
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
    CSV.read('./colleges.csv')
  end
end
