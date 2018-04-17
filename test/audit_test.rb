require './test/test_helper'
require './lib/audit'
require './lib/company'

class AuditTest < MiniTest::Test

  def setup
    @c = Company.new
    @c.load_projects('./data/projects.csv')
    @c.load_employees('./data/employees.csv')
    @c.load_timesheets('./data/timesheets.csv')
    @a = Audit.new
  end

  def test_instantiation
    assert_instance_of Audit, @a
  end

  def test_load_company_returns_a_company
    expected = Company
    actual = @a.load_company(@c).class

    assert_equal expected, actual
  end

  def test_it_can_find_weekends
    @a.load_company(@c)
    expected = 'weekend'
    actual = @a.check_timesheet_dates

    assert_equal expected, actual
  end

end
