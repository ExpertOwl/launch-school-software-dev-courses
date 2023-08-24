INVALID_INPUT = "That's not a valid number".freeze
SUFFIXES = %w[1st 2nd 3rd 4th 5th last].freeze
INPUT_STR = 'Enter the %s number'.freeze

def searching
  arr, last_number = call_input_methods
  if arr.include?(last_number)
    (puts "The number #{last_number} appears in #{arr}")
  else
    (puts "The number #{last_number} does not appear in #{arr}")
  end
end

def call_input_methods
  arr = six_numbers_from_input
  last_number = arr.pop
  [arr, last_number]
end

def six_numbers_from_input
  arr = []
  counter = 0
  SUFFIXES.each do |suffix|
    puts format(INPUT_STR, suffix)
    number = valid_number_from_user
    counter += 1
    arr << number
  end
  arr
end

def valid_number_from_user
  input = ''
  loop do
    input = gets.chomp
    break if int?(input)

    puts INVALID_INPUT
  end
  input.to_i
end

def int?(input)
  input.to_i.to_s == input
end

searching_101
