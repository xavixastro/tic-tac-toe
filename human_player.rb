class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position()
        puts "Player #{self.mark}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split(" ")
        if pos.length != 2 || ("a".."z").include?(pos[0]) || ("a".."z").include?(pos[0])
            raise "Invalid position"
        else
            return pos.map(&:to_i)
        end
    end

end