class Board
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end
  attr_reader :size

  def [](arr)
    r, c = arr
    @grid[r][c]
  end

  def []=(pos, val)
    r, c = pos
    @grid[r][c] = val
  end

  def num_ships
    @grid.flatten.count { |el| el == :S }
  end

  def attack(pos)
    #  r, c = pos
    if self[pos] == :S
      self[pos] = :H
      puts "you sunk m batlleship!"
        return true
    else
        self[pos] = :X
        return false
    end
  end

  def place_random_ships
    num = (@size * 25) / 100
    while self.num_ships < num
      i = @grid.length
      r = rand(0...i)
      c = rand(0...i)
      pos = [r, c]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map { |sub| sub.map { |el| el == :S ? :N : el }}
  end

  def self.print_grid(arr)
    arr.each { |sub| puts sub.join(" ") }
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end