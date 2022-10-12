class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "Please enter a position with a space between. For example '1 2'"
        input = gets.chomp
        position = input.split.map(&:to_i)
        begin
            if legal_positions.include?(position)
                puts "#{mark} played at #{position}" 
            end 
        rescue
            "please put in legal coordinates"
        end
    end



end