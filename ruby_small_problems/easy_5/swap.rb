def swap(string_of_words)
  new_words = []
  words = string_of_words.split
  words.each do |word|
    new_words.push(swap_first_and_last(word))
  end
  new_words.join(' ')
end

def swap_first_and_last(word)
  word.length
  if word.length == 1
    word
  else
    word[-1] + word[1..-2] + word[0]
  end
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
