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

end
