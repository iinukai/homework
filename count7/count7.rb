# coding:utf-8

# *** 戦略 ***
# 1桁目は10ごとにかたまりサイズ1
# 2桁目は100ごとにかたまりサイズ10
# 3桁目は1000ごとにかたまりサイズ100
# つまり
# n桁目は10**nごとにかたまりサイズ10**(n-1)
# をかぞえる

class Count7
  # 探す数字(1-9の間…0はばぐります)
  @target

  def initialize(targetNo)
    if targetNo.between?(1, 9)
      # カウント可
      @target = targetNo;
    else
      fail "target must between 1 and 9."
    end
  end

  def count(number)
    exp   = 0 # 10**0の位から計算スタート
    count = 0

    puts "[ #{number} ]"

    loop {
      keta     = 10 ** exp
      subCount = 0

      if number / keta == 0
        # 桁がなくなった
        break
      end

      if number < @target * keta
        # 最初の出現位置より小さい
        break
      end

      # その桁に存在する数を数える
      mod   = number % (keta * 10)
      shift = number - (@target * keta)  # 計算対象の桁がtargetのとき0にくるように合わせる
      if mod.between?(@target * keta, (@target * keta) + keta -1)
        subCount += (shift / (keta * 10) * keta) + (number % keta + 1) # かたまりの中で終わっているとき：それまでに出現したかたまりの数＋端数
        puts "sub1: #{exp+1} #{subCount}"
      else
        subCount += (shift / (keta * 10) * keta) + (keta)              # かたまりの外で終わっているとき：それまでに出現したかたまりの数(0にくるように合わせたので、+keta している)
        puts "sub2: #{exp+1} #{subCount}"
      end
=begin
      mod   = number % (keta * 10)
      shift = number + ((10 - @target) * keta)  # 計算対象の桁がtargetのとき1桁上がるように合わせる
      if mod.between?(@target * keta, (@target * keta) + keta -1)
        subCount += (shift / (keta * 10) * keta) - keta + (number % keta + 1) # かたまりの中で終わっているとき：それまでに出現したかたまりの数＋端数 (かたまりの先頭を越えると桁があがるので、-keta している)
        puts "sub1: #{exp+1} #{subCount}"
      else
        subCount += (shift / (keta * 10) * keta)                              # かたまりの外で終わっているとき：それまでに出現したかたまりの数
        puts "sub2: #{exp+1} #{subCount}"
      end
=end

      count += subCount

      exp += 1  # 次の桁にいきます
    }

    puts count

    return count
  end
end

