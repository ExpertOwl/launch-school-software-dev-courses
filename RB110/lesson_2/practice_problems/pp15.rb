arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]


def all_even(hash)
  hash.all?{|_,val| val.all?{|x| x.even?}}
end
arr.select! do |hash|
  all_even(hash)
end


p arr