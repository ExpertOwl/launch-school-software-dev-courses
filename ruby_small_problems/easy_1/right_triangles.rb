def triangle(int)
  (1..int).each do |x| 
    puts "#{' '*(int-x)}#{'*'*x}"
  end
  end




triangle(5)