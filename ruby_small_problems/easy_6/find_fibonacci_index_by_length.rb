

=begin
P Statement: Write a method that calculates and returns the index of the first fibonacci number tha thas the number
             of digits specified as an argument
  Input: Integer corresponding to the desired number of digits

  Output: Index of first fib. number which has at least that many digits

    Rules:
      Implicit: Number of digits is positive and >= 1
      Explicit: num_dig >= 2
  Edge cases:
    num_dig = 2 or very large -> no real issues (performance)
    num_dig = 1 -> 1

E

find_fibonacci_index_by_length(2) == 7
find_fibonacci_index_by_length(3) == 12
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

D
  Integer, running total

A
  Init index = 1
  Init running_total = 1

  loop do
    current_number = previous_number + previous_previous_number
    previous_previous_number = previous_number
    previous_number = current_number

  check if running_total has enough digits
    if true:
      return index
    if false:
      do nothing
  end

  check if running_total has enough digits ->
divide by 10 until number is less than 10
number of digits is number of times it was divived, plus one
1/10 -> 0+1 digit
10/10 = 1 -> 1+1 digits
100/10 = 10, /10 = 1 -> 2+1 digits

=end


def find_fibonacci_index_by_length(num_dig)
index = 1
previous_number = 1
previous_previous_number = 0
current_number = 1
  until has_enough_digits?(current_number, num_dig)
  current_number = previous_number + previous_previous_number
  previous_previous_number = previous_number
  previous_number = current_number
  index += 1
  end
index
end

def has_enough_digits?(running_total, target_number_of_digits)
  num_digits = 1
  until running_total < 10
    running_total /= 10
    num_digits +=1
  end
  num_digits >= target_number_of_digits
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
