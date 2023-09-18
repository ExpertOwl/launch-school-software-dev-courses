#Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"

default_dict = {}

statement.each_char do |char|
  if char == " "
    next
  elsif default_dict.include?(char)
    default_dict[char] += 1
  else
    default_dict[char] = 1
  end
end

p default_dict