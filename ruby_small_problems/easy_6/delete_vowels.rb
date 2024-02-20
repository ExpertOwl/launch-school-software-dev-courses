# P
#   Given an array of strings, return an array containing the same string values with vowels removed
#
#   Input: Array of strings
#   Output: New array of same strings with vowels removed
#
#   rules:
#     Explicit: case is perserved
#               Y is not a vowel
#     Implicit: All vowel strings will return empty string
#               No vowel strings will be unchanged
#               Can be new string objects or mutated string objects.
#
# E
# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
#
# D Array as given. List of vowels as constant
#
# A
#   For each string in array
#     for each string, use delete to remove vowels
#     Append result to list
#   return list
#
# C

VOWELS = 'AEIOUaeiou'.freeze

def remove_vowels(words)
  words.each { |word| word.delete!(VOWELS) }
end

puts remove_vowels(%w[abcdefghijklmnopqrstuvwxyz]) == %w[bcdfghjklmnpqrstvwxyz]
puts remove_vowels(%w[green YELLOW black white]) == %w[grn YLLW blck wht]
puts remove_vowels(%w[ABC AEIOU XYZ]) == ['BC', '', 'XYZ']
