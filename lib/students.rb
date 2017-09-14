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

  def self.count=(val)
    @@count = val
  end

  def self.count
    @@count
  end

  def self.all
    CSV.read('../students.csv')
  end
end

# students = []
# students.push(Student.new('ayush', 1,1))
# students.push(Student.new('ankush', 1,2))
# students.push(Student.new('maanav', 1,3))
# # p students
# CSV.open('../students.csv', 'w') do |csv_object|
#   students.each do |c|
#     csv_object << [c.id, c.name, c.college_id , c.course_id]
#   end
# end
# p Student.all
