def leap_year?(year)
  if !(year % 4).zero?
    false
  elsif !(year % 100).zero?
    true
  else
    (year % 400).zero?
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240_000) == true
puts leap_year?(240_001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
