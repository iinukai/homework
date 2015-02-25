# coding: utf-8

require 'benchmark'
require './count7'

counter7 = Count7.new(7)

proc_time = Benchmark.realtime do
  counter7.count(7)
  counter7.count(70)
  counter7.count(77)
  counter7.count(700)
  counter7.count(777)
  counter7.count(986)
  counter7.count(99)
  counter7.count(2345)
  counter7.count(6789)
  counter7.count(77777)
  counter7.count(23678947)
  counter7.count(732465890)
  counter7.count(1912478363)
end
puts "time : #{proc_time} sec"
