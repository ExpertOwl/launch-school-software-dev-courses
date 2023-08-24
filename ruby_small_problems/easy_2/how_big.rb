SQ_M_TO_FT =  10.7639 

def how_big
  puts "Enter the length in meters"
  length = gets.chomp.to_f
  puts "Enter the width in meters"
  width = gets.chomp.to_f 
  area_m = length*width
  area_ft = (area_m * SQ_M_TO_FT).round(2)
  puts "the area of the room is #{area_m} square meters (#{area_ft} square ft)"
end

how_big