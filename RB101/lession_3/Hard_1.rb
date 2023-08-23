#Q4 

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false if dot_separated_words.size != 5 
  result = while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      unless is_an_ip_number?(word)
        return false
  end
  return result
end