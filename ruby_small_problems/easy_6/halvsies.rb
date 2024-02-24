#Write a method that takes an array as an arugment and retursnt wo arrays (a pair of nested arrays) that contain the first half and second half of the array
#Odd number arrays should have their middle element placede in the first arry.

# A:
# init two empty arrays, first_half and second_half
# iterate over the list
#if  index =< list_length/2 append to first list
#if index > list_length/2 append to second list


def halvsies(list)
  first_half = []
  second_half = []
  list.each_with_index do |item, index|
    if index < list.length/2.0
      first_half << item
    else
      second_half << item
    end
  end
  [first_half, second_half]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
