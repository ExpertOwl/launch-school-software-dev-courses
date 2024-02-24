#reverse a given array in a non-mutating way


def reverse(list)
  new_list = []
  list.each do |item|
    new_list.unshift(item)
  end
  new_list
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []
p reverse([1,2,3,4])
