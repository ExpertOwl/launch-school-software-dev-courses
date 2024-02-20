#Practice Problem 1
#Given the array below

#flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
flinthash = {}
flintstones.length.times do |index|
  flinthash[flintstones[index]] = index
end

p flinthash