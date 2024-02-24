=begin
Write a method that takes an Array as an argument, and reverses its elements in place;
that is, mutate the Array passed into this method. The return value should be the same Array object.

Problem:
  Input: List
  Output: same list object with all its values reveresd (input[0] = output[-1], etc)

  Implicit rules:
                -list items can be anything
                -items themselves are not reversed
                -reversed empty list is an empty list
  Explicit rules:
                - list must be mutated (done in place)

  Edge cases: -empty list
              -list of lists (should sublists be reversed?)
              -long lists (performance)
E:
  list = [1,2,3,4]
  result = reverse!(list)
  result == [4, 3, 2, 1] # true
  list == [4, 3, 2, 1] # true
  list.object_id == result.object_id # true

  list = %w(a b e d c)
  reverse!(list) == ["c", "d", "e", "b", "a"] # true
  list == ["c", "d", "e", "b", "a"] # true

  list = ['abc']
  reverse!(list) == ["abc"] # true
  list == ["abc"] # true

  list = []
  reverse!(list) == [] # true
  list == [] # true
D:
  Second array to use as a queue

A:
  Initialize empty array queue
  until list is empty:
    pop last item of list
    append last item of list to queue
     now list[-1] is queue[0], list[-2] = queue[1] etc.
  end
  until queue is empty
    pop first item of queue to first item of list
    now first item of queue (last item of list) is first item of list
  end


C:

=end
def reverse!(list)
  queue = []
  until list.empty?
    queue.append(list.pop)
  end
  until queue.empty?
    list.append(queue.shift)
  end
  list
end

p result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true


p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

p reverse!(list) == [] # true
p list == [] # true
