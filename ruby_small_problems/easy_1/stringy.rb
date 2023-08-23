def stringy(int, start = 1)
  str = ''
  next_str = start
  loop do
    str << next_str.to_s
    next_str = next_str == 1 ? 0 : 1
    break if str.length == int
  end
  str
end

puts stringy(6) == '101010'
puts stringy(6, 0) == '010101'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
