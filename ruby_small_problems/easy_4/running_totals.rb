=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.
input: array of numbers 
output: new  array where new_array[n] = sum(old_array[0..n])
  [a[0], a[0] + a[1], a[0] + a[1] + a[2],  ...]

  Alg: 
    Init new empty array to build
    Init running total as zero 
    Iterate over origional array 
    At each point, append the sum of the running_total and old_arry[n] to new_array
=end 


def running_total(arry)
  running_total = 0 
  new_array = []
  arry.each do |number|
    running_total += number
    new_array << running_total
  end 
  new_array
end

def running_total_each_with_obj(arry)
  running_total = 0 
  arry.each_with_object([]) do |number, new_array|
    running_total += number
    new_array << running_total
  end 
end

def running_total_with_reduce(arry) 
  running_total = 0
  arry.reduce([]) do |result_array, element|
    running_total += element 
    result_array << running_total
  end 
end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

# p running_total_each_with_obj([2, 5, 13]) == [2, 7, 20]
# p running_total_each_with_obj([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total_each_with_obj([3]) == [3]
# p running_total_each_with_obj([]) == []

p running_total_with_reduce([2, 5, 13]) == [2, 7, 20]
p running_total_with_reduce([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_with_reduce([3]) == [3]
p running_total_with_reduce([]) == []