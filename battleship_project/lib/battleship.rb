require_relative "./board.rb"
require_relative "./player.rb"

class Battleship
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = (n * n) / 2
  end
  attr_reader :board, :player

  def start_game
    @board.place_random_ships
    puts @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships == 0
      puts "you win"
      true
    else
      false
    end
  end

  def game_over?
    win? || lose?
  end

  def turn
    pos = @player.get_move
    @remaining_misses -= 1 if !@board.attack(pos)
    @board.print
    puts @remaining_misses

  end
end