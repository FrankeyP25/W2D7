class Board
    attr_reader :max_height

    def self.build_stacks(stacks)
        Array.new(stacks) {Array.new()}
    end

    def initialize(stacks, height)
        raise "rows and cols must be >= 4" if stacks < 4 || height < 4
        @max_height = height
        @stacks = Board.build_stacks(stacks)
    end

    def add(token, stack_index)
        if @stacks[stack_index].length < @max_height
            @stacks[stack_index] << token
            true
        else
            false
        end
    end

    def vertical_winner?(token)
        # How can vertical wins happen?

        (0...@stacks.length).each do |stack|
            count = 0
            (0...@max_height).each do |i|
                if @stacks[stack][i] == token
                    count += 1
                end
            end
            return true if count == @max_height
        end
        false
    end

    def horizontal_winner?(token)
       (0...@max_height).any? { |i|  @stacks.all? { |stack| token == stack[i] } }
        # Why does this not work?

        # How can horizontal wins happen?
        # Paste from vertical_winner then work from there
    end

    def winner?(token)
        horizontal_winner?(token) || vertical_winner?(token)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
