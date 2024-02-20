# Problem:  Given an arry of integers return a new array an
# array with those integers sorted based on their alpbabetic english names
#
#   Input: Array of integers w/ numbers between 0 and 19
#
#   Output: Array of integers, sorted alphabetically
#
# Rules:
#   Explicit:  Numbers are betweem zero and 19
#   Implcit:  At most 20 integers, Each number should only occor once(?), should return a new array
#
#   Edge cases:
#     Empty list
#     List w/ duplicates
#     long list
#
# Examples:
#   [0, 1] => [zero, one] =sort=> [one, zero] => [1,0]
#
# Datastructure:
#   -Array
#   -Dict to translate between numbers and their english letters.
#
# Algorithm:
#   From inpuit, get list
#
#   replace each item in list with the english word for it
#     have const. dictionary relating words
#     iterate over list replacing items one by one via dict. lookup
#   sort list
#     should be a builtin method
#   translate back
#     have const. dictionary relating words to numbers (can maybe define with a built in invert?)
#     iterate over list replacing items one by one via dict. lookup
#
#   return list
#

NUM_TO_ENG = %w[zero one two three four
                five six seven eight nine
                ten eleven twelve thirteen fourteen
                fifteen sixteen seventeen eighteen nineteen].freeze

ENG_TO_NUM = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
               'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9,
               'ten' => 10, 'eleven' => 11, 'twelve' => 12, 'thirteen' => 13, 'fourteen' => 14,
               'fifteen' => 15, 'sixteen' => 16, 'seventeen' => 17, 'eighteen' => 18, 'nineteen' => 19 }.freeze

def num_to_eng(numbs)
  words = []
  numbs.each { |numb| words.push(NUM_TO_ENG[numb]) }
end

def eng_to_num(words)
  numbs = []
  words.each { |word| numbs.push(ENG_TO_NUM[word]) }
  numbs
end

def alphabetic_number_sort(numbers)
  words = num_to_eng(numbers)
  words = words.sort
  eng_to_num(words)
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
