require 'csv'
require_relative 'persons'
# Class Teacher provides info about teachers
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Teacher < Person
  @@count = 0

  attr_accessor :college_id, :courses

  def initialize(name, college_id,courses)
    @@count += 1
    @college_id = college_id
    @course = courses
    super(@@count, name)
  end

  def self.count=(val)
    @@count = val
  end

  def self.count
    @@count
  end

  def self.all
    CSV.read('../teachers.csv')
  end
end

# teachers = []
# teachers.push(Teacher.new('MathsTeacher', 1,[1]))
# teachers.push(Teacher.new('PhysicsTeacher', 1,[2]))
# teachers.push(Teacher.new('ChemistryTeacher', 1,[3]))
# CSV.open('../teachers.csv', 'w') do |csv_object|
#   teachers.each do |c|
#     csv_object << [c.id, c.name, c.college_id, c.courses]
#   end
# end
# p Teacher.all