def get_input(type)
input = nil 
  loop do 
    puts "Input a #{type}"
    input = gets.chomp
    break if input
  end  
  input 
end

def madlibs
  words = {noun: '', verb: '', adjective: '', adverb: ''}

  words.map do |key, _|
    words[key] = get_input(key)
  end
  puts "There once was an #{words[:adjective]} #{words[:noun]}. The #{words[:adjective]} #{words[:noun]} loved to #{words[:adverb]} #{words[:verb]} "
end 




madlibs