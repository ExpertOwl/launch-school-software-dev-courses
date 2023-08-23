def reversed_number(int)
  str = int.to_s
  arr = str.split('')
  arr.reverse!
  arr.join().to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
p reversed_number(12000) == 21