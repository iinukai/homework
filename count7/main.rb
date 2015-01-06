# coding:utf-8

require 'benchmark'
require './count7'

counter7 = Count7.new(7)

tStart = Time.now.usec
counter7.count(7)
counter7.count(77)
counter7.count(99)
counter7.count(77777)
counter7.count(23678947)
counter7.count(732465890)
counter7.count(1912478363)
tEnd = Time.now.usec - tStart
puts "time : #{tEnd} usec"
