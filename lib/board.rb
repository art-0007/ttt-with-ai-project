require 'pry'
class Board
attr_accessor :cells

    

    def initialize(cells = [])
        @cells = cells 
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")      
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position (num)
        cells[num.to_i - 1] 
    end

    def full?
        cells.detect{|x| x == " "} == nil
    end

    def turn_count
        cells.count{|token| token == "X" || token == "O"}
    end

    def taken?(index)
        #binding.pry
        if self.position(index) == " "
            return false
        else
            return true
        end
    end

    def valid_move?(ind)
        #binding.pry
        if self.position(ind) == " " && (1..9).include?(ind.to_i)
            return true
        else
            return false
        end
    end

    def update (input, player)
       # binding.pry
        cells[input.to_i - 1] = player.token 
    end
    
end