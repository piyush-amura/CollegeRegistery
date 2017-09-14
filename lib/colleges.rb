require 'csv'
# Class College provides info. about college
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class College
  @@count = 0
  attr_accessor :id, :name,:courses,:students,:teachers

  def initialize(name)
    @@count += 1
    @id = @@count
    @name = name
    @courses  = [1,2,3]
    @students = [1,2,3]
    @teachers = [1,2,3]
  end

  def self.count=(val)
    @@count = val
  end

  def self.count
    @@count
  end

  def self.all
    CSV.read('../colleges.csv')
  end
end
# colleges = []
# colleges.push(College.new('Fergusson College'))
# CSV.open('../colleges.csv', 'w') do |csv_object|
#   colleges.each do |c|
#     csv_object << [c.id, c.name, c.courses, c.teachers , c.students]
#   end
# end
# p College.all
