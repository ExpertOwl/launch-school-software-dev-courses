OPERATIONS = %w[+ - * % **]

puts 'Enter the first number'
first_number = gets.chomp.to_i

puts 'Enter the second number'
second_number = gets.chomp.to_i

arr = [first_number, second_number]

OPERATIONS.each do |operation|
  puts "#{first_number} #{operation} #{second_number} = #{arr.inject(operation)}"
end
