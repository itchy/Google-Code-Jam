# 
# INPUT
#
# 5                         => Total number of test cases
# 0 0 2 EA                  0 => BBN, 0 => OO, 2 => MOVES 
# 1 QRI 0 4 RRQR
# 1 QFT 1 QF 7 FAQFDFQ
# 1 EEZ 1 QE 7 QEEEERA
# 0 1 QW 2 QW


def parse_data_set(data)
  rows = IO.read(data).split(/\n/)
  num_moves = rows.shift
  set = []
  
  rows.each_with_index do |move, i|
    h = Hand.new
    h.parse(move)
    if h.errors
      puts "Errors with hand #{i}"
    else 
      # do the move
      # puts h.play.inspect
      set << "Case ##{i+1}: #{h.play}\n".gsub(/"/, '')  
    end  
  end
  set
end