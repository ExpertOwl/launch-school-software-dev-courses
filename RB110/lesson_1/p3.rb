
#remove people with age 100 and greater.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

filtered_ages = ages.select do |key, value|
  value < 100
end

p filtered_ages.to_h

