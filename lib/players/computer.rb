
module Players
    class Computer < Player 
        #attr_accessor :board
        #combos = Game::WIN_COMBINATIONS
        
            #binding.pry
        def move(board)
            h = Hash[board.cells.each_with_index.map {|v,i| [i, v]}]
            m = h.select {|k,v| v == " " }   #possible_moves
            c = h.select {|k,v| v == "X" }   #computer_moves
            p = h.select {|k,v| v == "O" }   #player_2_moves
            combos = Game::WIN_COMBINATIONS
            #binding.pry
            case
            when combos.detect {|a| (a-c.keys).length == 1 && !(a-c.keys)[0].to_s.taken?} != nil
               input = ((m.keys&c.keys)[0]+1)
            when combos.detect {|a| (a-p.keys).length == 1 && !(a-c.keys)[0].to_s.taken?} != nil
                input = ((m.keys&c.keys)[0]+1)
            when m.keys.include?(4)
                input = 5 
                #binding.pry
            # when  
            # #binding.pry
            #     poss = m.keys + c.keys
            #     arr_lines = combos.each {|a| (a&poss).length == 3}        # all possibilities for "X" and "_"
            #     arr_x_lines = arr_lines.select{|n| n.any?{|el| c.include?(el)}}     # "X" possibilities
            #     arr_empty_lines = arr_lines-arr_x_lines
            #     if  arr_x_lines != []  &&   arr_empty_lines != []                              # "_" possibilities
            #     input = arr_x_lines.detect{|el| arr_empty_lines.detect{|e| (el&e).length == 1}}.find(&:itself)
            #     end
            #binding.pry
            #else 
                
                # until !board.taken?(input)
                #     idx = (1..9).to_a.sample 
                #     if   valid_move?(ind)
                #     input = ind
                #     end
                # end
            input.to_s
            end 

        end 
    end
end
