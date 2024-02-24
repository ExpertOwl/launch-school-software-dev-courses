=begin

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
Do not use the method Array#rotate or Array#rotate! for your implementation.


P
  Input: An array
  output: a new 'rotated' array with new_arr[n] = old_array[n+1] &  new_array[-1] = old_array[0]

  Rules:
    Implicit: Sub arrays should not be rotated
              same # of elements for input and output

    Explicit: Origional array should not be modified
      Array will have at least one value


    Edge Cases:
    empty array: should return empty array
    one item array: should return one item array

E
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

D
  array

A
init new_array = old_array[1..-1]
append old_array[0] to end of new_array


=end

def rotate_array(array)
  new_array = array[1..-1]
  new_array.append(array[0])
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']
