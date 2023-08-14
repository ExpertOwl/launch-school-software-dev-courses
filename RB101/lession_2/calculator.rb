require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def convert_s_to_num(num)
  if integer? num
    num.to_i
  elsif float? num
    num.to_f
  end
end

def name
  name = nil
  loop do
    name = gets.chomp
    break unless name.empty?

    prompt(MESSAGES['invalid_name'])
  end
  name
end

def number(message_key)
  number = nil
  loop do
    prompt MESSAGES[message_key]
    number = gets.chomp
    break if valid_number?(number)

    prompt(MESSAGES['invalid_number'])
  end
  number
end

def operator
  operator = nil
  loop do
    operator = gets.chomp
    break if %w[1 2 3 4].include?(operator)

    prompt MESSAGES['invalid_operation']
  end
  operator
end

prompt MESSAGES['welcome']
name = name()
prompt("Hi #{name}!")

loop do
  number1 = number('get_num_1')
  number2 = number('get_num_2')
  number1 = convert_s_to_num(number1)
  number2 = convert_s_to_num(number2)
  prompt MESSAGES['operator_prompt']
  operator = operator()
  result = case operator

           when '1'
             number1 + number2
           when '2'
             number1 - number2
           when '3'
             number1 * number2
           when '4'
             number1.to_f / number2
           end

  prompt MESSAGES['result'].concat(result.to_s)
  prompt MESSAGES['continue?']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt MESSAGES['thanks']
