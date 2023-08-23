#Q1
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.include?("Spot")
p ages['Spot']

#Q2
munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase
p munsters_description.capitalize
p munsters_description.downcase
p munsters_description.upcase

#Q3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages.merge!(additional_ages)
p ages

#Q4
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.include?('dino')

#Q5
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
p flintstones

#Q6
flintstones.append('Dino')
p flintstones

#Q7
flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)
flintstones.concat(%w(Dino Hoppy))
p flintstones

#Q8
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index('house'))
p advice

#Q9 
statement = "The Flintstones Rock!"
p statement.count('t')

#Q10
title = "Flintstone Family Members"
p title.center(40)