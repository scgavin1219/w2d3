class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def initialize(n)
        @grid = Array.new(n, :N) {Array.new(n, :N)}
        @size = n * n
    end

    def [](array)
        @grid[array.first][array.last]
    end

    def []=(position, value)
        @grid[position.first][position.last] = value
    end

    def num_ships
        @grid.flatten.count { |ele| ele == :S} 
    end

    def attack(position)
        if self[position] == :S
            self[position] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[position] = :X
            return false
        end
    end

    def place_random_ships
        amt = @size / 4
        n = @grid.length

        while self.num_ships < amt
            row = rand(0...n)
            col = rand(0...n)
            pos =[row, col]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele == :S
                    :N
                else
                    ele
                end
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end


end
