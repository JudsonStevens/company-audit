require './test/test_helper'
require './lib/employee'

class EmployeeTest < Minitest::Test

  def setup
    @e = Employee.new('5', 'Sally Jackson', 'Engineer', '2015-01-01', '2018-01-01')
  end

  def test_instantiation
    assert_instance_of Employee, @e
  end

  def test_attributes
    expected = 5
    actual = @e.employee_id

    assert_equal expected, actual

    expected = 'Sally Jackson'
    actual = @e.name

    assert_equal expected, actual

    expected = 'Engineer'
    actual = @e.role

    assert_equal expected, actual

    expected = Date
    actual = @e.start_date.class

    assert_equal expected, actual

    expected = Date
    actual = @e.end_date.class

    assert_equal expected, actual
  end
end
