#! ruby
 
# needs to output following example for each line/row/moves
# 
 
require 'robot'
require 'pass'

small_data_set = 'A-small-practice.in'
small_results = "Small-results.txt"

large_data_set = 'A-large-practice.in'
large_results = "Large-results.txt"

def parse_data_set(data)
  rows = IO.read(data).split(/\n/)
  num_rows = rows.shift.to_i
  set = []
  
  rows.each do |row|
    moves =[]
    row = row.to_s.split(/\s/)
    num_moves = row.shift.to_i
  
    begin
      move = []
      move << row.shift.to_s
      move << row.shift.to_i
      moves << move
    end while not row.empty? 
    puts "Error: move count: #{moves.length} doesn't mach provided count: #{num_moves} on line ?" unless moves.length == num_moves   
    set << moves
  end
  puts "Error: row count: #{set.length} doesn't mach provided count: #{num_rows} on line ?" unless set.length == num_rows
  set
end
  
results = ""  
data = parse_data_set(large_data_set)
i = 0
data.each do |moves|
  i += 1
  p = Pass.new(moves)
  time = p.make_pass
  results << "Case ##{i}: #{time}\n"
end
File.open(large_results, 'w') {|f| f.write(results) }
# puts results
