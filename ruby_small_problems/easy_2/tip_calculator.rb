INPUT_TO_PERCENT = 100

def tip_calculator
  puts "What is the bill?"
  bill = gets.chomp.to_f
  puts "What is the tip percentage? Enter 10 for 10% "
  percentage = gets.chomp.to_f / INPUT_TO_PERCENT
  tip = (bill * percentage)
  total = (bill + tip)
  puts "The tip is $#{format('%.2f',tip)}"
  puts "The total is $#{format('%.2f',total)}"
end

tip_calculator