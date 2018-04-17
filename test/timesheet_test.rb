require './test/test_helper'
require './lib/timesheet'

class TimesheetTest < Minitest::Test

  def setup
    @t = Timesheet.new('5', '7', '2015-01-01', '120')
  end

  def test_instantiation
    assert_instance_of Timesheet, @t
  end

  def test_attributes
    expected = 5
    actual = @t.employee_id

    assert_equal expected, actual

    expected = 7
    actual = @t.project_id

    assert_equal expected, actual

    expected = Date
    actual = @t.date.class

    assert_equal expected, actual

    expected = 120
    actual = @t.minutes

    assert_equal expected, actual
  end
end
