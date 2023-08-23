#Algorithm 
# Check the length of the string. If odd, the middle value is str[len/2]. If even, the length of the string is str[len/2:len/2+1] 



def center_of(str)
  length = str.length
  center_index = length/2

  result =  length.odd? ? str[center_index] : str[center_index-1, 2] 

end

p center_of('I love ruby') 
p center_of('Launch School') 
p center_of('Launch')
p center_of('Launchschool')
p center_of('x') 

=begin
'Launchschool' => len is 12. want to return 'hs' which is 5 and 6. 12/2 = 6, should return str[len-1] + str[len]  
'I love ruby' => len is 11, want to return 'e' which is 5. 11/2 = 5. Should return str[len]
=end