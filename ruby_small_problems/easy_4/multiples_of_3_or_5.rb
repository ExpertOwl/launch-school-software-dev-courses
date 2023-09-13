=begin
# Input: integer 
# Output: Return sum of integers which are divisible by 3 or 5 
  #Edge case? Multiple of 3 and 5? 
  #Edge case: small number no multiples of 3 or 5 (input is 1 or two)

  #Algorithim 
  -initialize running total 
  - iterate over numbers betweem 1 and input 
  - for each number: 
    - check if number is divisible by 3 or 5
      -if so, add to running total
      if not, skip 
    return total 
=end
# def multisum(int)
#   counter = 0
#   (1..int).each {|x| counter +=  x if (x % 5 ).zero? ||( x % 3).zero?} 
#   counter
# end

def multiple?(int)
  (int % 5 ).zero? || (int % 3).zero?
end

def multisum(int)
  counter = (1..int).select{|x| multiple?(x)}
  counter.reduce(:+) 
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168