puts "What is your current age?"
age = gets.chomp.to_i
puts "What age would you like to retire?"
retirement_age = gets.chomp.to_i
workyears = retirement_age - age

current_year = Time.now.year
retirement_year = Time.new(current_year+workyears)

puts "Its #{current_year}. You will retire in the year #{retirement_year.year}"
puts "Only #{workyears} years to go!"