require 'yaml'
MESSAGES = YAML.load_file('mortgage_messages.yml')

MONTHS_IN_A_YEAR = 12
USER_INPUT_TO_PERCENT = 100

def prompt(message)
  puts("=> #{message}")
end

def calculate_monthly_payment(loan_ammount, loan_duration_months, monthly_interest_rate)
  loan_ammount * (monthly_interest_rate / (1 - ((1 + monthly_interest_rate)**-loan_duration_months)))
end

def number_from_user
  input = nil
  loop do
    input = gets.chomp
    break if number?(input)

    prompt(MESSAGES['invalid_number_input'])
  end
  input.to_f
end

def number?(input)
  float?(input) || integer?(input)
end

def float?(input)
  input.to_f.to_s == input
end

def integer?(input)
  input.to_i.to_s == input
end

def format_output(monthly_payment, interest_paid, total, loan_duration_months)
  monthly_payment = trim_decimal(monthly_payment)
  interest = trim_decimal(interest_paid)
  total = trim_decimal(total)
  format(MESSAGES['output'], monthly_payment: monthly_payment, \
                             interest: interest, \
                             total: total, \
                             loan_duration_months: loan_duration_months)
end

def trim_decimal(number)
  format('%0.2f', number)
end

continue = ''

loop do
  prompt(MESSAGES['Welcome'])
  prompt(MESSAGES['get_ammount'])
  loan_ammount = number_from_user
  prompt(MESSAGES['get_apr'])
  yearly_apr = number_from_user
  yearly_apr /= USER_INPUT_TO_PERCENT
  monthly_interest_rate = yearly_apr / MONTHS_IN_A_YEAR
  prompt('Enter the loan duration in years')
  loan_duration_years = number_from_user
  loan_duration_months = loan_duration_years * MONTHS_IN_A_YEAR
  monthly_payment = calculate_monthly_payment(loan_ammount, loan_duration_months, monthly_interest_rate)
  total = monthly_payment * loan_duration_months
  interest_paid = total - loan_ammount
  prompt format_output(monthly_payment, interest_paid, total, loan_duration_months)
  prompt(MESSAGES['Continue?'])
  continue = gets.chomp.downcase
  break unless continue == 'y'
end
