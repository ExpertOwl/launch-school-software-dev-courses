def xor?(bool_1, bool_2)
  bool_1 != bool_2 
end

puts xor?(true, true)  == false
puts xor?(false, false) == false
puts xor?(true, false) == true
puts xor?(false, true) == true