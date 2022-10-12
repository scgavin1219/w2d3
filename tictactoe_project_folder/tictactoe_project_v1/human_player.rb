class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Please enter a position with a space between. For example '1 2'"
        input = gets.chomp
        position = input.split.map(&:to_i)
        raise "invalid position" if position.length != 2
        
        position.each do |num|
            if num < 0 || num > 2
                raise "invalid position"
            end
        end 
    end



end