#With reverse 
def palindrome?(enum)
  enum == enum.reverse
end




#without reverse
def palindrome?(enum)
  left = 0
  right = enum.size - 1
  until left > right do 
    return false if enum[left] != enum[right] 
    left += 1
    right -= 1
  end
  true
end 

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindrome?([1,2,1]) == true
