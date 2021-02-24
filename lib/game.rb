class Game
attr_accessor :board, :player_1, :player_2, :cells
attr_reader :WIN_COMBINATIONS

WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8],[0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
      ]

    def initialize (player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        #binding.pry
        @board = board
        @player_1 = player_1
        @player_2 = player_2
    end

    def won?
        WIN_COMBINATIONS.each do |arr|
            #binding.pry
            if  (board.cells[arr[0]]  == "X"   &&  board.cells[arr[1]]   == "X" &&  board.cells[arr[2]]  == "X") || (board.cells[arr[0]]  == "O"   &&  board.cells[arr[1]]   == "O" &&  board.cells[arr[2]]  == "O")
            #(arr - arr_x).empty? || (arr - arr_0).empty?
            return arr 
            end
        end
        false   
    end

    def draw?
        board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def current_player
        board.turn_count % 2 == 0 ? player_1 : player_2
    end

    def winner
        if won?
        board.cells[self.won?[0]]   
        else
        nil
        end   
    end

    def turn 
        # binding.pry
        input = current_player.move(board)
       if board.valid_move?(input)
        board.update(input, current_player)
        board.display
       else
            puts "invalid"
            turn
        end  
    end

    # makes valid moves (FAILED - 1)
    # asks for input again after a failed validation (FAILED - 2)
    # changes to player 2 after the first turn (FAILED - 3)
    
    
    def play
        #binding.pry
        until over? do 
            turn  
          end
        if won?
            puts "Congratulations #{winner}!"
          elsif draw? == true
              puts "Cat's Game!"
         end
        
    end



end