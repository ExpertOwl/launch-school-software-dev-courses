#Q1
message = "The Flintstones Rock!"
(1..10).each {|num_spaces| puts (" " * num_spaces) + message }

#Q2
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40+2}" 

#Q3
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end

# Uses modulo to determine if divisor divides number 
#Returns factors   

#Q4
#Will both return same value. Differences are in inplementation i.e. returing mutated value passed in or returning newly a created variable   

#Q5
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

#Q6
#Output will be 42-8 

#Q7
#Yes.

#Q8
#puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
#puts rps(rps("paper", "rock"), "rock")
#puts rps("paper", "rock")
#puts "paper"

#Q9
#bar(foo)
#bar(yes)
#no