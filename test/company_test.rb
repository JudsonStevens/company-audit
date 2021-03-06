require './test/test_helper'
require './lib/company'

class CompanyTest < Minitest::Test
  def setup
    @c = Company.new
  end

  def test_instantiation
    assert_instance_of Company, @c
  end

  def test_attributes_start_empty
    expected = []
    actual = @c.employees

    assert_equal expected, actual

    expected = []
    actual = @c.projects

    assert_equal expected, actual

    expected = []
    actual = @c.timesheets

    assert_equal expected, actual
  end

  def test_it_can_load_employees_correctly
    @c.load_employees('./data/employees.csv')
    expected = 'Susan Smith'
    actual = @c.employees.first.name

    assert_equal expected, actual

    expected = 'Engineer'
    actual = @c.employees[1].role

    assert_equal expected, actual
  end

  def test_it_can_catch_bad_data_on_employee_load_in
    expected = {:success=>false, :error=>'bad data'}
    actual = @c.load_employees('./data/bad_employees.csv')

    assert_equal expected, actual
  end

  def test_it_can_load_projects_correctly
    @c.load_projects('./data/projects.csv')
    expected = 'More Widgets'
    actual = @c.projects[1].name

    assert_equal expected, actual

    expected = 'Acme Project'
    actual = @c.projects.last.name

    assert_equal expected, actual
  end

  def test_it_can_catch_bad_data_on_project_load_in
    expected = {:success=>false, :error=>'bad data'}
    actual = @c.load_projects('./data/bad_projects.csv')

    assert_equal expected, actual
  end

  def test_it_can_load_timesheets_correctly
    @c.load_timesheets('./data/good_timesheets.csv')
    expected = 1
    actual = @c.timesheets.last.project_id

    assert_equal expected, actual

    expected = Date
    actual = @c.timesheets.first.date.class

    assert_equal expected, actual
  end

  def test_it_can_catch_bad_data_on_timesheet_load_in
    expected = {:success=>false, :error=>'bad data'}
    actual = @c.load_timesheets('./data/bad_timesheets.csv')

    assert_equal expected, actual
  end

  def test_it_can_find_the_right_employee
    @c.load_employees('./data/employees.csv')
    expected = 'Susan Smith'
    actual = @c.find_employee_by_id(1).name

    assert_equal expected, actual

    actual = @c.find_employee_by_id(100)

    assert_nil actual
  end

  def test_it_can_find_the_right_project
    @c.load_projects('./data/projects.csv')
    expected = 'More Widgets'
    actual = @c.find_project_by_id(2).name

    assert_equal expected, actual

    actual = @c.find_project_by_id(11)

    assert_nil actual
  end
end
