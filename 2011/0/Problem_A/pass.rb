#! ruby

# SSJ May 13 2011
# Pass uses two robot classes to determine how long it would take
# to push the provided buttons in sequence asynchronously

class Pass
  def initialize(moves=[["O", 2], ["B", 27], ["O", 22] ])
    @moves = moves
    @O = Robot.new
    @B = Robot.new
    @time_for_pass = 0
  end
  

  def make_pass
    @moves.each do |move|      
      bot = move[0]
      button = move[1]
      
      if bot.to_s[/O/i]
        bot_to_push = @O
        bot_to_wait = @B
      else
        bot_to_push = @B
        bot_to_wait = @O
      end
      
      # puts bot_to_push.inspect
        
      time = bot_to_push.push(button)
      bot_to_wait.add_time(time)
      
      @time_for_pass += time    
    end
    @time_for_pass  
  end  

end