
INT_INPUT_MSG = "Please input a positive integer"
INT_ERR_MSG = "That is not a positive integer"

OPR_INPUT_MSG = "Please enter 's' to calculate the sum, and 'p' to calculate the product"
OPR_ERR_MSG = "Sorry! Unknown operation"

SUM_MSG = "The sum of the numbers between 1 and "
PROD_MSG = "The product of the numbers between 1 and "

def print(msg)
  puts "=> #{msg}"
end

def sum_int(int)
  sum = 0
  (1..int).each do |x| 
    sum += x
  end
  sum
end

def prod(int)
  product = 1
  (1..int).each do |x| 
    product *= x
  end
  product
end

def get_input(input_message, error_message, is_valid)
  input = ""
    loop do 
      print input_message
      input = gets.chomp!
      break if method(is_valid).call(input)
      print error_message
    end
  convert_input_type(input)
end

def convert_input_type(input)
  is_int(input) ? input.to_i : input 
end

def is_int(input)
  (input == 0 || input.to_i.to_s == input)  && input.to_i >= 0 
end

def is_str(input)
  input.respond_to?(:split)
end

def is_operation(input)
  input.downcase == 'p' ||  input.downcase == 's'
end


def procsess(input, operation)
operation == 'p' ? PROD_MSG + "#{input} is #{prod(input)}" : SUM_MSG + "#{input} is #{sum_int(input)}"
end

input = get_input(INT_INPUT_MSG, INT_ERR_MSG, :is_int)
operation = get_input(OPR_INPUT_MSG , OPR_ERR_MSG, :is_operation)
result = procsess(input, operation)
puts result


  
  