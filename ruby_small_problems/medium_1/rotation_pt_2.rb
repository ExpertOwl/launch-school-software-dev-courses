def rotate_array(array)
  new_array = array[1..-1]
  new_array.append(array[0])
end

def rotate_rightmost_digits(number, digits_to_rotate)
  num_as_array = number.to_s.split("")
  num_as_array[-digits_to_rotate..] = rotate_array(num_as_array[-digits_to_rotate..])
  num_as_array.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
