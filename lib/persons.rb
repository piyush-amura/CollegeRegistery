# Class Person provides description about person. personal info
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class Person
  attr_accessor :name, :id

  def initialize(id,name)
    @id = id
    @name = name
  end
end
