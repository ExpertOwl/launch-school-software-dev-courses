=begin
  Input: String which corresponds to an integer 
  Output: Integer which corresponds to string 

  Algorithim: 
    Init running total integer
    Iterate over string
    For each digit, look up string to number conversion in dictionary, then multiply by 10^n, and add to running total  
=end
STRING_TO_NUMBER = {'1' =>  1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' =>  7, '8' => 8, '9' => 9, '0' => 0}

def map_chars_to_digits(str)
  str.chars.map {|char| STRING_TO_NUMBER[char]}
end

def build_int_from_digits(dgs)
  running_total = 0
  dgs.each_index do |index| 
    running_total += dgs[index] * 10**(dgs.size-index-1)
  end
  running_total
end

def string_to_integer(str)
  digits = map_chars_to_digits str
  build_int_from_digits(digits)
end

p string_to_integer('4321')
p string_to_integer('570') == 570

