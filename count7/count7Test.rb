# coding: utf-8

=begin
require 'test/unit'
require './count7'

class TestCount7 < Test::Unit::TestCase
=end

require 'minitest/autorun'
require './count7'

class TestCount7 < Minitest::Test
  def test_count7
    counter7 = Count7.new(7)

    # count()は副作用がないように設計されているが、それが読み取れない。
    # クラスのメソッドではなく、関数にしたほうがいいかもしれない。
    # でもstaticなローカル変数が使われてると同じ事になるのでは。
    assert_equal(20,    counter7.count(99))
    assert_equal(38890, counter7.count(77777))

    assert_equal(counter7.count(99),        counter7.count2(99))
    assert_equal(counter7.count(77777),     counter7.count2(77777))
    assert_equal(counter7.count(123456789), counter7.count2(123456789))
  end
end
