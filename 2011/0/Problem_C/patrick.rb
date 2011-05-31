class Patrick
  
  def add(a, b="0")
    begin
      bin_a = to_bin(a).to_s.split(//)
      bin_b = to_bin(b).to_s.split(//)
    rescue
      p a
      p to_bin(a)
      p b
      p to_bin(b)
      return
    end    
    
    
    
    if bin_a.length > bin_b.length
     bin_b = padd(bin_b, bin_a.length)
    elsif bin_a.length < bin_b.length
     bin_a = padd(bin_a, bin_b.length)
    end  
    
    answer=[]
    bin_a.each_with_index do |bit, i|
      if bit.to_i + bin_b[i].to_i == 1
        answer << "1"
      else
        answer << "0"
      end    
    end  
    to_dec(answer.join)
  end
  
  def add_array(array)
    value = (array.shift).to_i
    array.each do |b|
      value = add(value, b)
    end  
    value
  end
  
  
  def padd(arry, length)
    begin
      arry.unshift "0"
    end while arry.length < length 
    arry
  end
  
  
  
  
  ## Function to convert a given integer string/number into binary formatted string
  def to_bin(number)
     number = Integer(number);
     if(number == 0)
        return 0;
     end
     ret_bin = "";
     ## Untill val is zero, convert it into binary format
     while(number != 0)
        ret_bin = String(number % 2) + ret_bin;
        number = number / 2;
     end
     return ret_bin;
  end

  ## Function to convert a given binary string into decimal number
  def to_dec(number)
     ret_dec = 0;
     number.split(//).each{|digit|
        ret_dec = (Integer(digit) + ret_dec) * 2;
     }
     return ret_dec/2;
  end  
end  