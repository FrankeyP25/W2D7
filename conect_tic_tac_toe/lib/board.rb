
class Board
    def self.build_stacks(n)
        Array.new(n) {Array.new()}
    end

    def initialize(n, max)
        raise "rows and cols must be >= 4" if n < 4 || max < 4
        @max_height = max
        @stacks = Board.build_stacks(n)
    end

    attr_reader :max_height

    def add(token, i)
        if @stacks[i].length < @max_height
            @stacks[i] << token
            true
        else
            false
        end
    end

    def vertical_winner?(token)
        @stacks.any? { |row| (0...@max_height).all? { |i| row[i] == token } }
    end

    def horizontal_winner?(token)
        (0...@max_height).any? { |i| @stacks.all? { |col| col[i] == token } }
    end

    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end
end