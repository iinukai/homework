# coding: utf-8

require 'benchmark'
require './fig.rb'
require './figSet.rb'

=begin
枚数と切り取りパターンと生成時間
1枚:1
2枚:2      0.000110[sec]
3枚:6      0.000218[sec]
4枚:19     0.001154[sec]
5枚:63     0.006862[sec]
6枚:216    0.566100[sec]
7枚:760    0.588732[sec]
8枚:2725   7.293678[sec]
9枚:9910  98.993062[sec]

…あってる？
=end

# 1枚は1パターンだけ
s1 = Array.new(1){Array.new(1).fill(true)}
figSet = FigSet.new([Fig.new(s1)])

# 2枚以降を生成します
for count in 2..9
  set = []
  procTime = Benchmark.realtime do
    puts "枚数:#{count}"
    figSet = figSet.plusOne
    set = figSet.getPattern
  end
  p set.size
  puts "time : #{procTime}"
  p set
  puts "=================="
end

