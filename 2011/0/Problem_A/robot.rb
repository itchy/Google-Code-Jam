#! ruby

# SSJ May 13 2011
# designed for Google Code Jame 2011 qualifying round test a
# The robot knows how it will take to push the required button
# It is also provided how much time it could have used while the other robot was pushing
# It subtracts the available time from its move time and returs additional time
# being the total time it would take to push the button asynchronously
# this time is then given to the other robot to derive same results


class Robot  
  def initialize 
    # always start at one with 0 seconds
    @position = 1
    @open_time = 0
  end
  
  def push(button)
    # how many seconds will it take to push the button
    time_to_move = time_used(button)
    
    # execute move & reset open_time
    move_to(button)
    
    # add 1 second to time to push button
    time_to_move + 1
  end
  
  def add_time(time=0)
    @open_time += time
  end
  
private
  def move_to(button)
    @position = button
    @open_time = 0
  end

  def distance(button)
    #return distance to button in seconds
    (button-@position).abs
  end
  
  def time_used(button)  
    time = distance(button) - @open_time
    if time > 0 then
      time
    else
      0
    end    
  end
  
end  