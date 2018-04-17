require './test/test_helper'
require './lib/audit'
require './lib/company'

class AuditTest < MiniTest::Test

  def setup
    @a = Audit.new
  end

  def test_instantiation
    assert_instance_of Audit, @a
  end

  def test_load_company_returns_a_company
    c = Company.new
    expected = Company
    actual = @a.load_company(c).class

    assert_equal expected, actual
  end

  def test_it_can_find_weekends
    c = Company.new
    c.load_projects('./data/projects.csv')
    c.load_timesheets('./data/good_timesheets.csv')
    @a.load_company(c)

    expected = 'none'
    actual = @a.check_timesheet_dates_for_weekend

    assert_equal expected, actual

    c1 = Company.new
    c1.load_projects('./data/projects.csv')
    c1.load_timesheets('./data/weekend_timesheet.csv')
    @a.load_company(c1)

    expected = 'weekend'
    actual = @a.check_timesheet_dates_for_weekend

    assert_equal expected, actual
  end

  def test_it_can_find_invalid_start_date
    c = Company.new
    c.load_projects('./data/projects.csv')
    c.load_timesheets('./data/good_timesheets.csv')
    @a.load_company(c)

    expected = 'none'
    actual = @a.check_timesheet_date_for_invalid_billing

    assert_equal expected, actual
  end

end
