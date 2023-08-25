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
=begin 
Input is am integer which is a year
Should return the century in which year was in. 
e.g. 2000 -> 20th 
  New centruies begin in years that end in 01 
  2000 -> 20th 
  2001 -> 21st  
Code 
1) Figure out which century year belongs to 
  - convert input to float 
  - divide by 100
  - round up to the nerest digit
  - 2005/100 => 20.5 => 21 => 21st century 
2) Append suffix to year 
  Problem: 
  I assumed only last digit in century relavent for suffix, this is not the case 113 should be 113th but last digit is 3 gives 113rd  

  1-9 have rules, 11-19 have different rules but, 11-19 have same suffix => could be another case 
  really, depends on last two digits 100th 2123rd 2113th

  New strategy: 
    century is one digit: Look up directly 
    Century is two or more digits => take last two digits and look up directly 

    lookup 
    11th
    12th
    13th
    14th
    15th
    65th

    21st 31st 41st 11th??? 1st

    Christ on a cracker I found this difficult!
=end 

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
