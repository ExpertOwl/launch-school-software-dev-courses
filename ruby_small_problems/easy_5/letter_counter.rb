def word_sizes(string)
  size_counts = {}
  string.split.each do |word|
    word_size = word.delete('^A-Za-z').size
    if size_counts.include?(word_size)
      size_counts[word_size] += 1
    else
      size_counts[word_size] = 1
    end
  end
  size_counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}