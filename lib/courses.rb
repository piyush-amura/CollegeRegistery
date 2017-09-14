require 'csv'
# Class Course provides course info.
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Course
  @@count = 0
  attr_accessor :id, :name

  def initialize(name)
    @@count+=1
    @id = @@count
    @name = name
  end

  def self.count=(val)
    @@count = val
  end

  def self.count
    @@count
  end

  def self.all
    CSV.read('../courses.csv')
  end
end

# courses = []
# courses.push(Course.new('Maths'))
# courses.push(Course.new('Physics'))
# courses.push(Course.new('Chemistry'))
# p courses
# CSV.open('../courses.csv', 'w') do |csv_object|
#   courses.each do |c|
#     csv_object << [c.id, c.name]
#   end
# end
# p Course.all