=begin
O(n) sol'n
Try some sliding window technique...
example [2,1,2,4,3,5,6,5,6,10]], 10 -> 1

lots of trouble to get here but the plan for an O(n) solution is:

1) extend right until we find a subarray that hits target
2) drop left until we go under target
3) if this length is better than our best length, update it.
repeat back to 1)

right_index = 0
total = 0
smallest_so_fat = inf

1)
add nums[right_index] to total
if total >= target, break. Otherwise, increase right index and repeat

2)
subtract nums[left_index] from total
if total <= target, break otherwise, increase left idex and repeat
end
if this subarray's length is the smalelst we've found so far, (right_index - left_index + 1 < smallest_so_far)
  smallest_so_far ==right_index - left_index + 1
end
go to 1
=end


def min_sub_array_len(target, nums)
  running_array = []
  total = 0
  smallest_so_far = nil
  nums.each do |number|
    total += number
    running_array << number
    if total >= target
      while total >= target do
        smallest_so_far ||= running_array.length
        smallest_so_far = running_array.length if running_array.length < smallest_so_far
        total -= running_array.shift
      end
    end
  end
  smallest_so_far == nil ? 0 : smallest_so_far
end
