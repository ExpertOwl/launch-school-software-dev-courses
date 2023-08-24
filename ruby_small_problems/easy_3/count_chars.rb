puts "Please write word or multiple words:"
words = gets.chomp
num_chars = words.gsub(' ', '').length

puts "There are #{num_chars} characters in '#{words}' "
