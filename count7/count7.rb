# coding: utf-8

# *** 戦略 ***
# 1桁目は10ごとにかたまりサイズ1
# 2桁目は100ごとにかたまりサイズ10
# 3桁目は1000ごとにかたまりサイズ100
# つまり
# n桁目は10**nごとにかたまりサイズ10**(n-1)
# をかぞえる
# 計算量はO(log n)

class Count7
  # 探す数字(1-9の間…0はばぐります)
  @target

  def initialize(targetNo)
    if targetNo.between?(1, 9)
      # カウント可
      @target = targetNo;
    else
      fail "target must be between 1 and 9."
    end
  end

  def count(number)
    exp   = 0 # 10**0の位から計算スタート
    count = 0

    puts "[ #{number} ]"

    loop do
      keta     = 10 ** exp
      beginNo  = @target * keta
      subCount = 0

      if number < keta
        # 桁がなくなった
        break
      end

      if number < beginNo
        # 最初の出現位置より小さい
        break
      end

      # その桁に存在する数を数える
      mod   = number % (keta * 10)
      shift = number - beginNo  # 計算対象の桁がtargetのとき0にくるように合わせる
      if mod.between?(beginNo, beginNo + keta - 1)
        subCount += (shift / (keta * 10) * keta) + (number % keta + 1) # かたまりの中で終わっているとき：それまでに出現したかたまりの数＋端数
        puts "sub1: #{exp+1} #{subCount}"
      else
        subCount += (shift / (keta * 10) * keta) + (keta)              # かたまりの外で終わっているとき：それまでに出現したかたまりの数(0にくるように合わせたので、+keta している)
        puts "sub2: #{exp+1} #{subCount}"
      end
=begin
      mod   = number % (keta * 10)
      shift = number + ((10 - @target) * keta)  # 計算対象の桁がtargetのとき1桁上がるように合わせる
      if mod.between?(beginNo, beginNo + keta - 1)
        subCount += (shift / (keta * 10) * keta) - keta + (number % keta + 1) # かたまりの中で終わっているとき：それまでに出現したかたまりの数＋端数 (かたまりの先頭を越えると桁があがるので、-keta している)
        puts "sub1: #{exp+1} #{subCount}"
      else
        subCount += (shift / (keta * 10) * keta)                              # かたまりの外で終わっているとき：それまでに出現したかたまりの数
        puts "sub2: #{exp+1} #{subCount}"
      end
=end

      count += subCount

      exp += 1  # 次の桁にいきます
    end

    puts count
    return count
  end

  def count2(number)
    exp   = 0 # 10**0の位から計算スタート
    count = 0

    puts "[ #{number} ]"

    loop do
      keta = 10 ** exp

      if number < keta
        # 桁がなくなった
        break
      end

      kNum = number.to_s[(exp * -1) -1].to_i  # ketaの位の数字をとってくる

      if kNum < @target
        tmp = (number / (keta * 10)) * keta
      elsif kNum == @target
        tmp = (number / (keta * 10)) * keta + (number % keta) + 1
      else
        tmp = (number / (keta * 10)) * keta + keta
      end
      puts tmp
      count += tmp

      exp += 1;  # 次の桁にいく
    end

    puts "total:#{count}"
    return count
  end
end

