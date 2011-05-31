class Hand
  attr_accessor :combos, :opposals, :sequence, :results, :errors
  @wha = []
  def initialize
    self.combos = []
    self.opposals = []
    self.results = []
  end
  
  def parse(move)
    moves = move.split(/\s/)
    combine = moves.shift.to_i
    x = 0 
    while x < combine
      self.combos << moves.shift
      x += 1
    end
    
    opposed = moves.shift.to_i
    x = 0 
    while x < opposed
      self.opposals << moves.shift
      x += 1
    end
    
    num_moves = moves.shift
    errors = "move" unless moves.length == 1
    
    self.sequence = moves.shift 
  end
  
  
  def play
    if combos.empty? && opposals.empty?
      sequence.split(//).inspect
    else
      sequence.split(//).each { |e| add_element(e) }
      results.inspect
    end    
  end
  
private
  def add_element(e)
    results << e.upcase
    process_combos
    process_opposals
  end
  
  def process_combos 
    i = 1
    combos.each do |combo|
      if results.size > 1
        c = combo.upcase
        if combo.split(//).include?(results[-1]) && combo.split(//).include?(results[-2])
          # This was a good idea gone bad -- comparing two letters by adding their ASCII values together lead to lots of
          # issues and very little gain
          v = c[0] + c[1]
          c2 = results.join("").upcase
          v2 = c2[-1] + c2[-2]
          if v2 == v
            results.pop
            results.pop
            results << combo.split(//)[-1]
          end
        end    
      end  
    end  
  end
  
  def process_opposals
    if results.size > 1 
      opposals.each do |o|
        a = o.split(//)
        # puts "opposal" + results.inspect
        if results.include?(a[0]) && results.include?(a[1])
          results.clear
        end  
      end  
    end
  end  
  
  
end  