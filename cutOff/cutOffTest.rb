# coding: utf-8

require 'minitest/autorun'
require './cutOff'

class TestCutOff < Minitest::Test
  def test_count
    assert_equal(15, count(5, 3, 1))
    assert_equal(1,  count(1, 2, 2))
    assert_equal(0,  count(2, 2, 5))
    assert_equal(7,  count(2, 3, 2))
    assert_equal(10, count(2, 3, 3))
  end

  def test_count2
    assert_equal(15, count2(5, 3, 1))
    assert_equal(1,  count2(1, 2, 2))
    assert_equal(0,  count2(2, 2, 5))
    assert_equal(7,  count2(2, 3, 2))
    assert_equal(10, count2(2, 3, 3))
  end

  def test_both
    assert_equal(count(100, 100, 3), count2(100, 100, 3))
    assert_equal(count(100, 100, 5), count2(100, 100, 5))
  end
end
