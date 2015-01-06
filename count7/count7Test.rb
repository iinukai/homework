# coding;utf-8

require 'test/unit'
require './count7'

class TestCount7 < Test::Unit::TestCase
  def test_count7
    counter7 = Count7.new(7)

    assert_equal(20,    counter7.count(99))
    assert_equal(38890, counter7.count(77777))
  end
end
