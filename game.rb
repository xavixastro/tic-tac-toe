require_relative 'board.rb'
require_relative 'human_player.rb'

class Game

    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @currentPlayer = @player1        
    end

    def switch_turn
        @currentPlayer = @currentPlayer == @player1 ? @player2 : @player1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @currentPlayer.get_position
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