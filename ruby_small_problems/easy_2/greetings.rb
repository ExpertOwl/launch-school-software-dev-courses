puts 'what is your name?'
name = gets.chomp
if name.end_with?('!') 
  name = name.sub('!', '')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}"
end