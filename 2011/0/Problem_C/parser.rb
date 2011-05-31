
def parse_data_set(data)
  rows = IO.read(data).split(/\n/)
  num_piles = rows.shift
  set = []
  
  rows.each_slice(2) do |num_candies, pile|
    candies = pile.to_s.split(/\s/)
    puts "Error: candy count: #{candies.length} doesn't mach provided count: #{num_candies} on line ?" unless candies.length == num_candies.to_i  
    set << candies
  end
  puts "Error: pile count: #{set.length} doesn't mach provided count: #{num_piles} on line ?" unless set.length == num_piles.to_i
  set
end