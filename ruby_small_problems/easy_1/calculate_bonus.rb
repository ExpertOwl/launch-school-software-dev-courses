def calculate_bonus(base_ammount, apply_bonus)
  bonus = apply_bonus ? base_ammount/2 : 0 
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000