#! ruby
 
# needs to output following example for each line
# Case #1: NO
# Case #2: 11

require 'parser'
# require 'patrick'

if false
  data_set = 'C-small-practice.in'
  result_file = "Small-results.txt"
else
  data_set = 'C-large-practice.in'
  result_file = "Large-results.txt"
end  
results = ""
piles = parse_data_set(data_set)
# p = Patrick.new
# # TEST Partick
# puts  "ERRER 12 + 5 != 9" unless p.add(12,5) == 9
# puts  "ERRER 5 + 4 != 1" unless p.add(5,4) == 1
# puts  "ERRER 7 + 9 != 14" unless p.add(7,9) == 14
# puts  "ERRER 50 + 10 != 56" unless p.add(50,10) == 56
# puts  "Patrick Tested!"  

# this should be re-done...
# if it is possible to make Patrick happy any two piles of the same candy set will make him happy
# somehow - and I dont get this - Particks happyness == bitwise exclusive or of all candy values being equal to zero
# in other words pile[0].to_bin ^ pile[1].to_bin ... ^pile[-1].to_bin == 0
# FROM GOOGLE CODE ANALYSIS
piles.each_with_index do |pile, i| 
  pile.map! { |c| c.to_i }
  if pile.inject() {|result, element| result ^ element } == 0 
    p = pile.sort
    # give patrick the smallest candy
    p.shift 
    max = p.inject() { |result, element| result + element }
  else
    max = "NO"
  end      
  results << "Case ##{i+1}: #{max}\n"
end  

# ORIGINAL SOLUTION
#
# piles.each_with_index do |pile, i|  
#   no_cry_values = []
#   sean_pile = no_cry_values.max
#   pieces = pile.length
# 
#   # does 1 piece == the rest
#   # this was good enough for the small set & large
#   # because somehow, if Patrick will be happy - the piles can be split any way you want, like bitwise or
#   # so Sean should take all but the smallest piece
#   (0..pieces-1).each do |x|
#     temp = pile.dup
#     a = temp.delete_at x
#     if a.to_i == p.add_array(temp.dup)
#       temp.map!{ |t| t.to_i }
#       no_cry_values << temp.inject() {|result, element| result + element}
#     end
#   end 
#   
#   if no_cry_values.length > 0 then
#     max = no_cry_values.max
#   else
#     max = "NO"
#   end    
#   results << "Case ##{i+1}: #{max}\n"
# end  

File.open(result_file, 'w') {|f| f.write(results) }