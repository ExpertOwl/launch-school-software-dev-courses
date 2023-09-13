=begin
Input Positive integer or zero
output -> return string representation of the input 

can't really iterate over an ineger

algorithim
can start at ttop:
  get first digit which is a*10^len 
  convert to string
  subtract digit * a*10^ len 
  break if zero 
  get second digit which is b*10(^len -1 )
  subtract digit * 10 ^ (len-1)
  break if zero 
  ...
  get m'th digit which is 10^(len - m)
  
  convert 
  subtract
  break 
  
  get last digit which it 10&

digit = ones + tens + hundreds + ...
  -Get one's digit 
    => How do we get one's digit 
      531
    convert to string
  subtract one's digit 
  break if is zero
    get ten's didigit
    convert to strong 
  subtract if integer is zero 
=end

require 'pry'

NUMBER_TO_STRING = {1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9", 0=>"0"} 

def integer_to_string(int)
  string = ""
  loop do 
    digit = int % 10
    string << NUMBER_TO_STRING[digit] 
    int -= digit 
    int /= 10 
    break if int.zero?
  end
  string.reverse!
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'