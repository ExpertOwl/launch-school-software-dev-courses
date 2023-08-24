def return_negative(number)
  if number <= 0
     number
  else
    number * -1   
  end
end


def return_negative_ternary

p return_negative(0) == 0 
p return_negative(-5) == -5 
p return_negative(10) == -10