def multiply(a, b)
  a * b 
end

def square(a)
  multiply(a, a)
end

def power(base, exponent)
  result = 1
  exponent.times {result = multiply(result, base)}
  result
end

p power(2, 2) == 4 
p power(4, 4) == 4**4