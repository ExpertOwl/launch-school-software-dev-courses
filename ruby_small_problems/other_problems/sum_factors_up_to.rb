=begin
Problem:
  Given a integer target and a list of factors, sum all numbers which are multiples of factors and less than target

  Inputs: A positive integer
  outputs: A positive iteger which is the sum of all numbrs which are multiples of given factors [a..z] \sum
          {n*a... n*z} < | na, nz < 20 & all n*a..n*z are unique

  Requirements:
    Explicit: Use 3 and 5 as default factors if none are given

    Implicit: Common multiples should only be added once. (15 -> 3 and 5)
              Target number is not summmed even if it is a multiple
              All numbers are natural numbers
              Should work for any number of factors

  Edge cases:
    Target: Target is zero -> sum should be zero
            Target is very large (performance)
    Factors:
            One or more factors are greater than the target -> no multiples of that factor are included
              ALL factors > 20 -> sum = 0
              Factor is one -> sum all numbers from 1 to target
              Factor is zero -> ignore that factor
E
  sum_factors_up_to(5, 1) -> 1+2+3+4 => 10
  sum_factors_up_to(10, [2,3]) -> 2+4+6+8+3+9 -> 32
  sum_factors(0, [5]) -> 0

D
  Array is what comes to mind first
    Hash -> would not need to filter duplicates

    Hash where each key is a factor and each value is an arbitrary truthy value (we'll use True)
    e.g. sum_factors_up_to(5, 1)
      -> {1 => True, 2 => True, 3 = True... 5 => True}

A
  Initialize empty hash multiples
  Initialize total to 0
  Check if factors are given, if not, use [3,5]
  for factor in factors
    initialize current_factor = factor
    initialize current_value = factor
    while factor > target
      add factor to multiples with key True
      current_value += factor
  for factor in multiple.keys
    total += multiple
  return total
=end
def seen?(multiples, value)
  multiples[current_value]
end

def sum_factors_up_to(target, factors = [3, 5])
  seen_multiples = {}
  total = 0
  factors.each do |current_value|
    factor = current_value
    while current_value < target
      total += current_value unless seen_multiples.include?(current_value)
      seen_multiples[current_value] = true
      current_value += factor
    end
  end
  total
end

p sum_factors_up_to(5, [1]) == 1 + 2 + 3 + 4
p sum_factors_up_to(10, [2,3]) == 2 + 4 + 6 + 8 + 3 + 9
p sum_factors_up_to(0, [5]) == 0
p sum_factors_up_to(20, [2,3,5,25]) == 2 + 4 + 6 + 8 + 10 + 12 + 14 + 16 + 18 + 3 + 9 + 15 + 5
