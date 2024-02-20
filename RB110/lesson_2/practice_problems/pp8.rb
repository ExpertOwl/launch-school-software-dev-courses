hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

VOWELS = "AEIOUaeiou"
hsh.each do |_key, arr|
  arr.each do |word|
    word.each_char do |char|
      p char if VOWELS.include?(char)
    end
  end
end