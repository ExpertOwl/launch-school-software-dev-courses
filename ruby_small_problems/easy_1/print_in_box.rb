=begin
P: Problem:
  Input: String object

  Output: None. Print to screen the object in a box 

  +----+
  |    |
  | hi |
  |    |
  +----+

  rules: 
    Return nil 
    Output will be string 
    First line printed should be -'s equal to number of letters + 2, surrounded by +'s
    Second and fourth line should be spaces equal to number of letters + 2 srounded by |'s
    Third line should be | space str space | 

  E: examples => annoying to put 
  D: data structure => None needed, should be done through string concat/interpolation
  A:
   Get the size of the string
   Create string that represents line 1 and 5,
   Create string that represents line 3 and 4
   Create string that represents line 2
   Print  statements   

=end
def build_string(char, len, surrounding_char)
  surrounding_char+char*(len+2)+surrounding_char
end

def build_center(message)
  "| #{message} |"
end

def print_in_box(str)
  message_length = str.length
  if str.length > 80
    str = str[0..79]
    message_length = 80
  end
  
  str_line_1_5 = build_string('-', message_length, '+')
  str_line_2_4 =  build_string(' ', message_length, '|')
  str_line_3 = build_center(str)

  puts str_line_1_5
  puts str_line_2_4
  puts str_line_3
  puts str_line_2_4
  puts str_line_1_5
end 

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('-')
print_in_box("#{'a'*100}")