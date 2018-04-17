require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test

  def setup
    @e = Employee.new('5', 'Sally Jackson', 'Engineer', '2015-01-01', '2018-01-01')
  def test_instantiation

  end

  def test_attributes
  end
end
