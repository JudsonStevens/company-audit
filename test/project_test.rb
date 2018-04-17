require './test/test_helper'
require './lib/project'

class ProjectTest < Minitest::Test

  def setup
    @p = Project.new('123', 'Widget Maker', '2015-01-01', '2018-01-01')
  end

  def test_instantiation
    assert_instance_of Project, @p
  end

  def test_attributes
    expected = 123
    actual = @p.project_id

    assert_equal expected, actual

    expected = 'Widget Maker'
    actual = @p.name

    assert_equal expected, actual

    expected = Date
    actual = @p.start_date.class

    assert_equal expected, actual

    expected = Date
    actual = @p.end_date.class

    assert_equal expected, actual
  end
end
