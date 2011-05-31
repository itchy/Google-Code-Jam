#! ruby

# 
# INPUT
#
# 5                         => Total number of test cases
# 0 0 2 EA                  0 => BBN, 0 => OO, 2 => MOVES 
# 1 QRI 0 4 RRQR
# 1 QFT 1 QF 7 FAQFDFQ
# 1 EEZ 1 QE 7 QEEEERA
# 0 1 QW 2 QW
#
# OUTPUT
#
# Case #1: [E, A]
# Case #2: [R, I, R]
# Case #3: [F, D, T]
# Case #4: [Z, E, R, A]
# Case #5: []

require 'parser'
require 'hand'

if false
  data_set = 'B-small-practice.in'
  result_file = "Small-results.txt"
elsif true
  data_set = 'B-large-practice.in'
  result_file = "Large-results.txt"
else 
  data_set = 'test_data'
  result_file = 'test_result'  
end  

results = parse_data_set(data_set)
# puts results

File.open(result_file, 'w') {|f| f.write(results) }