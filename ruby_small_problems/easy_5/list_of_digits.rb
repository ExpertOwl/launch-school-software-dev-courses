=begin
P roblem: Given an integer, return the a list of digits in that number

  Inputs: A single integer
  Outputs: A list of all digits in that nuber

  Rules:
    Explit: Integer will be positive
            Input will be integers with at least one digit
    Implit: Digits should be returned in order 71 => [7,1]
            list will be length n where 10^n > integer > 10^n+1


E xamples:
  71 => [7,1]

D atastructure:
  List

A lgorithim:

  do int mod 10^n (n=1 to start)
    append result to list
    subtract result from integer
    if int = 0, stop
    else repeat with n+1


Code!
=end

# def digit_list(integer)
#   n = 1
#   digits = []
#   while integer > 0 do
#     integer
#     remainder = integer % 10**n
#     integer = integer - remainder
#     digits.unshift(remainder/(10**(n-1)))
#     n+=1
#   end
#   p digits
# end
def digit_list(integer)
  integer.to_s.chars.map {|char| char.to_i}
end
p digit_list(12345) == [1, 2, 3, 4, 5]     # => true
p digit_list(7) #== [7]                     # => true
p digit_list(375290) #== [3, 7, 5, 2, 9, 0] # => true
p digit_list(444) #== [4, 4, 4]             # => true

