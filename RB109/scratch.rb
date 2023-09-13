$x = 10 

def add_five
  sum = $x + 5
  $x = sum
end

add_five
puts $x