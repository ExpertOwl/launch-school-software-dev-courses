# Write your own version of the rails titleize implementation.
def titleize(words)
  words = words.split
  words.map! do |word|
    word[0].upcase + word[1..-1]
  end
  words.join(' ')
end


words = "the flintstones rock"
p titleize(words) == "The Flintstones Rock"