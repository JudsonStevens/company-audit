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



end
