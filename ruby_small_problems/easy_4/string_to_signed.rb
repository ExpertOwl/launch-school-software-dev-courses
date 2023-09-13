STRING_TO_NUMBER = {'1' =>  1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' =>  7, '8' => 8, '9' => 9, '0' => 0}

def string_to_signed_integer(str)
  sign, str = extract_sign(str)
  digits = map_chars_to_digits(str)
  sign == '-' ? build_int_from_digits(digits) * -1 : build_int_from_digits(digits) 
end

def extract_sign(str)
  case str[0]
  when '+'
    sign = '+'
    str = str[1..]
  when '-'
    sign = '-'
    str =str[1..]
  else
    sign = '+'
  end
  [sign, str]
end

def build_int_from_digits(dgs)
  running_total = 0
  dgs.each_index do |index| 
    running_total += dgs[index] * 10**(dgs.size-index-1)
  end
  running_total
end


def map_chars_to_digits(str)
  str.chars.map {|char| STRING_TO_NUMBER[char]}
end
a, b = [1, 2]

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100