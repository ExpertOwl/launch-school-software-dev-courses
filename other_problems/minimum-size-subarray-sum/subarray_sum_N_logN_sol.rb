=begin
Followup: O(n log n) solution
trouble here is seeing how to do this in O(n log n), log(n) on an array problem screams binary search tree, but order
matters so we can't sort. So we need to build a BST somehow. I thought hard and eventually gave up and looked for a hint

The list we want to build is for array [a,b,c,d,e,f,g] is a 'prefix sum' = [0, a, a+b, a+b+c, a+b+c+d, ... , a+b+...+g].
We can write prefix[i] = sum(nums[0..i])
The first key insight here is that each index corresponds to the length of its subarray. e.g. prefix[3] = a+b+c -> length 3.
The second key insight (that I had to look up) is that for a given two indicies (i,j) i - j = k where |k| corresponds to the length of another index.
i.e. prefix[7]-prefix [5] = prefix[5..7] -> a+b+c+d+e+f+g - a+b+c+d+e = f+g and also, nums[5..7] = [f,g] has length 7-5=2.
We are looking for shortest sum(nums[i..j]) >= target, can write
sum(nums[0..j])-sum(nums[0..index]) >= target
prefix[j..index] >= target
prefix[j] - prefix[index] >= target
prefix[j] >= target + prefix[index]
so iterating over all index...
  for a given index, we can search the tree for a value larger than prefix[index] + target. If this is found, prefix[i..j] >= target and sum([i..j]) >= target
  This will find all subarrays which match the criteria, the key here is that j - index gives us the length of the array
index is fixed, so to minimize length, we minimize j. we can return the rightmost value of prefix which is larger than prefix[index] + target.
Beacause j>i, larger i means smaller |j-i| and smaller subarray.
Whew!

Here is the alrogrithm:
set our best to max_float (1.0/0)
build the prefix array prefix[i]
  initially prefix = [0], then append sum(nums[0..i])
on each index (i) of the prefix array, preform binary search for j s.t. prefix[j] >= prefix[i] + target
if found, check if j-i is smaller than our best_so_far
  if so, update best_so_far
  if not, do nothing
if not found, do nothing
check if any valid subarrays were found (if max_float != 1.0/0)
  if so, return best_so_far
  if not, return 0
Binary search:
set l = 0 r = length + 1 m = (l+r)/2
base case:
if we've searched the whole tree
   return nil if prefix[m] < sub_taret, otherwise return j
else:
  if number < target, search right (update l = m + 1)
  if number >= tarfet,  search right (update r = m - 1)
=end

def binary_search(subarray_target, bst)
  left = 0
  right = bst.length-1
  mid =  nil
  until left >= right
    mid = left + (right - left)/2
    case bst[mid] <=> subarray_target
    when 0
      return mid
    when 1
      right = mid
    when -1
      left = mid + 1
    end
  end
  bst[left] >= subarray_target ? left : nil
end

def min_sub_array_len(target, nums)
  prefix = [0]
  total = 0
  best_length_found = 1.0/0
  nums.each do |num|
    total += num
    prefix.append(total)
  end
  prefix.each_with_index do |value, index|
    j = nil
    subarray_target = value + target
    j = binary_search(subarray_target, prefix)

    if j
      best_length_found = j-index if j-index < best_length_found
    end
  end
  best_length_found == 1.0/0 ? 0 : best_length_found
end
p min_sub_array_len(213, [12,28,83,4,25,26,25,2,25,25,25,12])
# p binary_search(12, [0, 12, 40, 123, 127, 152, 178, 203, 205, 230, 255, 280, 292])
