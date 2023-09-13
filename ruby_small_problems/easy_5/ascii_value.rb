def ascii_value(str)
  sum_of_ords = 0 
  for char in str.each_char
    sum_of_ords += char.ord
  end
  sum_of_ords
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0