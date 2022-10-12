class Board
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def valid?(position) 
        position.each do |num|
            if num > @grid.length - 1 || num < 0 
                return false
            end
        end
        true
    end

    def empty?(pos)
        self[pos] == '_'
    end

    def place_mark(position, mark)
        if empty?(position) && valid?(position)
            self[position] = mark
        else 
            raise "invalid position"
        end
    end

    def print
        @grid.each { |row| puts "#{row}" }
    end

    def win_row?(mark)
        @grid.each { |row| return true if row.uniq.length == 1 && row[0] == mark }
        false
    end

    def win_col?(mark)
        @grid.transpose.each { |row| return true if row.uniq.length == 1 && row[0] == mark }
        false
    end

    def win_diagonal?(mark)
        diag = []
        back_diag = []
        n = @grid.length

        (0...n).each do |i|
            diag << @grid[i][i]
            back_diag << @grid[i][-i - 1]
        end
        if diag.uniq.length == 1 && diag[0] == mark
            return true
        elsif
            back_diag.uniq.length == 1 && back_diag[0] == mark
            return true
        end
        false
    end

    def win?(mark)
        return true if win_col?(mark)
        return true if win_row?(mark)
        return true if win_diagonal?(mark)
        false
    end

    def empty_positions?
        @grid.flatten.include?("_")
    end

    def legal_positions
        legal = []
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                if @grid[i][j] == "_"
                    legal << [i, j]
                end
            end
        end
        legal
    end


end