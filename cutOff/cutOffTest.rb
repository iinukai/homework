# coding: utf-8

=begin
require 'test/unit'
require './cutOff'

class TestCutOff < Test::Unit::TestCase
=end

require 'minitest/autorun'
require './cutOff'

class TestCutOff < Minitest::Test
  def test_cutOff
    assert_equal(15, count(5, 3, 1))
    assert_equal(1,  count(1, 2, 2))
    assert_equal(0,  count(2, 2, 5))
    assert_equal(7,  count(2, 3, 2))
    assert_equal(10, count(2, 3, 3))
  end
end
