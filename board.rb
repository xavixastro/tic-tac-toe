class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}    
    end

    def valid?(position)
        row, col = position
        (0...@grid.length).include?(row) && (0...@grid.length).include?(col)
    end

    def empty?(position)
        row, col = position
        @grid[row][col] == "_"
    end

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            row, col = position
            @grid[row][col] = mark
        else
            raise "Invalid mark"
        end
    end

    def print
        @grid.each do |row|
            puts "#{row.join(" ")}"
        end
    end

    def win_row?(mark)
        @grid.any?{|row| row.all?{|el| el == mark}}
    end

    def win_col?(mark)
        @grid.transpose.any?{|row| row.all?{|el| el == mark}}
    end

    def win_diagonal?(mark)
        (0..@grid.length-1).all? {|idx| @grid[idx][idx] == mark } ||
        (0..@grid.length-1).all? {|idx| @grid[idx][-1-idx] == mark } 
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any?{|row| row.any?{|el| el == "_"}}
    end

    def legal_positions
        positions = []
        @grid.each_with_index do |row, idx1|
            row.each_with_index do |el, idx2|
                positions << [idx1, idx2] if el == "_"
            end
        end
        positions
    end

end