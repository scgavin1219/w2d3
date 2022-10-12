class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(array)
    array.all? { |ele| POSSIBLE_PEGS.include?(ele.upcase) }
  end

  def self.random(length)
    array = []
    length.times { array << POSSIBLE_PEGS.keys.sample}
    Code.new(array)
  end

  def self.from_string(pegs)
    array = pegs.split("")
    Code.new(array)
  end

  def initialize(array)
    if Code.valid_pegs?(array)
      @pegs = array.map(&:upcase)
    else
      raise "those are not all valid pegs"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

   def ==(other_code)
    self.length == other_code.length && self.num_exact_matches(other_code) == self.length
  end

  def num_exact_matches(code)
    (0...code.length).count { |i| code[i] == @pegs[i] }
  end

  def num_near_matches(guess)
    code_clone = self.pegs.dup
    guess_clone = guess.pegs.dup

    guess_clone.each_with_index do |ele, i|
      if ele == code_clone[i]
        guess_clone[i], code_clone[i] = nil, nil
      end
    end
    guess_clone.delete(nil)
    code_clone.delete(nil)

    count = 0 
    guess_clone.each_with_index do |ele, i|
      if code_clone.include?(ele)
        count += 1
        code_clone.delete_at(code_clone.index(ele))
      end
    end
    count
  end 

end
