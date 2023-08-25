def century(year)
  century = (year.to_f/100).ceil.to_s
  century << lookup_suffix(century)
  century 
end

def lookup_suffix(century)
  if century.size == 1 
    lookup_one_digit_suffix(century)
  else 
    lookup_two_digit_suffix(century)
  end
end

def lookup_one_digit_suffix(century)
  case century
    when '1'
      'st'
    when '2'
      'nd'
    when '3' 
      'rd'
    else 
      'th'
    end
end

def lookup_two_digit_suffix(century)
  two_digit = century[-2..-1]
  if two_digit[0] == '1'
    'th'
  else
    lookup_one_digit_suffix(two_digit[-1])
  end
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
