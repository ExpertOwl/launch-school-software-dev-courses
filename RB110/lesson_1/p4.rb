#Pick out the minimum age from our current Munster family hash:
AGE_OF_THE_UNIVERSE = 13.7 * 10 ** 9
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

lowest_age = AGE_OF_THE_UNIVERSE

ages.each {|_, age| lowest_age = age if age < lowest_age }

p lowest_age