NUMBER_TO_STRING = { 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9',
                     0 => '0' }.freeze

def integer_to_string(int)
  string = ''
  loop do
    digit = int % 10
    string << NUMBER_TO_STRING[digit]
    int -= digit
    int /= 10
    break if int.zero?
  end
  string.reverse!
end

def signed_integer_to_string(int)
  if int.negative?
    "-#{integer_to_string(-int)}"
  elsif int.positive?
    "+#{integer_to_string(int)}"
  else
    integer_to_string(int)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
