#Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = flintstones.index do |name|
  name[0,2]=='Be'
end

p index