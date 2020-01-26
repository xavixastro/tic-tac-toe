class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "Player #{self.mark}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(" ").map(&:to_i)
        
        while !legal_positions.include?(pos)
            puts "Invalid position"
            puts "Player #{self.mark}, enter two numbers representing a position in the format `row col`"
            pos = gets.chomp.split(" ").map(&:to_i)
        end
        
        pos
    end

end