# coding:utf-8

require 'benchmark'
require './cutOff'

# 実行方法
# ruby main.rb inputfile.in.txt

# ファイル名かくにん
@inputFile  = ARGV[0]
@outputFile = @inputFile.sub(/\.in\.txt$/, ".out.txt")

if @inputFile == @outputFile
  fail "file name must be fin with '.in.txt'."
end


# ファイル読み込み
# 一行目のデータ個数は無視する
@inputData = []
File.open(@inputFile).each_line do |line|
  matchData = /(?<column>\d+)\s+(?<row>\d+)\s+(?<cutSize>\d+)/.match(line)
  if matchData != nil
    @inputData << [matchData[:column].to_i, matchData[:row].to_i, matchData[:cutSize].to_i]
  end
end


# 内容確認
for data in @inputData
=begin
  if ! data[0].between?(1, 10)
    p data
    fail "column must be between 1 and 10."
  end
  if ! data[1].between?(1, 10)
    p data
    fail "row must be between 1 and 10."
  end
=end
  if ! data[2].between?(1, 5)
    p data
    fail "row must be between 1 and 5."
  end
end


# しらべる
answer = []
proc_time = Benchmark.realtime do
  for data in @inputData
    answer << count(data[0], data[1], data[2])
    p data, answer.last
  end
end
puts "time : #{proc_time} sec"


# output生成
File.open(@outputFile, "w") do |fd|
  for a in answer
    fd.puts a
  end
end

