require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'

class Game

    def initialize(size, hash)
        @players = []
        hash.each do |k, v| 
            v ? @players << ComputerPlayer.new(k) : HumanPlayer.new(k)    
        end
        @board = Board.new(size)
        @currentPlayer = @players.first      
    end

    def switch_turn
        @players.rotate!
        @currentPlayer = @players.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @currentPlayer.get_position(@board.legal_positions)
            @board.place_mark(pos, @currentPlayer.mark)
            if @board.win?(@currentPlayer.mark)
                @board.print
                puts "Player #{@currentPlayer.mark} WON the game"
                return 
            else
                self.switch_turn
            end
        end
        puts "DRAW, game over"
    end

end