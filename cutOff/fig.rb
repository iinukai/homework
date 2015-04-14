# 切り取り図形を表すクラス
class Fig
  @m_fig = [[]]

  def initialize(fig)
    @m_fig = fig
  end

  # 縦の長さ(行数)を返す
  def getRow
    return @m_fig.size
  end

  # 横の長さ(列数)を返す
  def getColumn
    return @m_fig[0].size
  end

  # そのますがマーキングされているか返す
  def marked?(row, column)
    fail "#[{row}, #{column} is NOT exist." if @m_fig[row][column] == nil

    return @m_fig[row][column]
  end

  # 図形が同じか判定する
  def ==(fig)
    if self.getRow != fig.getRow || self.getColumn != fig.getColumn
      return false
    end

    self.getRow.times do |row|
      self.getColumn.times do |col|
        if self.marked?(row, col) != fig.marked?(row, col)
          return false
        end
      end
    end

    return true
  end

  # 自分に1枚足した図形のセットを返す(ダブりなし)
  def plusOne
    #1枚足す用に、図形の周囲が空いている図形を用意する
    base = Array.new(self.getRow + 2){Array.new(self.getColumn + 2, false)}
    self.getRow.times do |row|
      self.getColumn.times do |col|
        base[row + 1][col + 1] = @m_fig[row][col]
      end
    end

    # 足した図形を作ってまとめる
    figSet = []
    base.size.times do |row|
      base[0].size.times do |col|
        # そのマスが使われてなく、4方向のどれかがつながるなら新しい図形候補
        add = false
        if base[row][col] == false
          if row > 0
            add = true if base[row - 1][col] == true  # 上がつながる
          end
          if row < base.size - 1
            add = true if base[row + 1][col] == true  # 下がつながる
          end
          if col > 0
            add = true if base[row][col - 1] == true  # 左がつながる
          end
          if col < base[0].size - 1
            add = true if base[row][col + 1] == true  # 右がつながる
          end
        end

        if add == true
          # 新しい図形をつくる
          newFigBase = deepFigCopy(base)
          newFigBase[row][col] = true
          newFig = Fig.new(newFigBase).triming

          # 今まで見つけた図形と違ったら追加する
          found = false
          for f in figSet
            if newFig == f
              found = true
              break
            end
          end
          figSet << newFig if found == false
        end
      end
    end

    return figSet
  end

  # AAでfigを表示する
  def show
    puts "----------------"
    puts "[#{self.getRow}, #{self.getColumn}]"
    self.getRow.times do |row|
      self.getColumn.times do |col|
        if self.marked?(row, col)
          print "*"
        else
          print "."
        end
      end
      print "\n"
    end
    puts "----------------"
  end

  # 図形から余分な行,列を外す
  # 一番外側だけ…
  def triming
    # 上を見る
    using = false
    self.getColumn.times do |col|
      if self.marked?(0, col)
        using = true
        break
      end
    end
    if using == false
      @m_fig.delete_at(0)
    end

    # 下を見る
    using = false
    self.getColumn.times do |col|
      if self.marked?(@m_fig.size - 1, col)
        using = true
        break
      end
    end
    if using == false
      @m_fig.delete_at(-1)
    end

    # 左を見る
    using = false
    self.getRow.times do |row|
      if self.marked?(row, 0)
        using = true
        break
      end
    end
    if using == false
      self.getRow.times do |row|
        @m_fig[row].delete_at(0)
      end
    end

    # 右を見る
    using = false
    self.getRow.times do |row|
      if self.marked?(row, @m_fig[row].size - 1)
        using = true
        break
      end
    end
    if using == false
      self.getRow.times do |row|
        @m_fig[row].delete_at(-1)
      end
    end

    return self
  end


private
  # 配列の深いコピー
  def deepFigCopy(fig)
    newFig = Array.new
    for rowArray in fig
      newFig << rowArray.dup
    end

    return newFig
  end

end

