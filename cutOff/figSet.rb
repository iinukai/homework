# coding: utf-8

require './fig.rb'

#図形のセットを保持するクラス
class FigSet
  @m_figSet = []

  def initialize(figArray)
    @m_figSet = figArray
  end

  # 保持している図形に1枚足した図形のセットを返す(ダブりなし)
  def plusOne
    newFigSet = []
    for baseFig in @m_figSet
      tmpFigSet = []
      for tmpFig in baseFig.plusOne
        add = true
        for newFig in newFigSet
          if tmpFig == newFig
            add = false
            break
          end
        end
        tmpFigSet << tmpFig if add == true
      end
      newFigSet += tmpFigSet
    end

    return FigSet.new(newFigSet)
  end

  # 切り取り種類の配列を返す
  def getPattern
=begin
    # 全ての要素を処理するので畳み込みで
    return @m_figSet.inject([]){|patternArray, fig| patternArray << [fig.getRow, fig.getColumn]}
=end
    # mapのほうが適当なきがする…
    return @m_figSet.map{|fig| [fig.getRow, fig.getColumn]}
  end

  # AAで表示
  def show
    for fig in @m_figSet
      fig.show
    end
  end

end


