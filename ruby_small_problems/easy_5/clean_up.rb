CHAR_TO_REPLACE = "-'*&" 

def cleanup(string)
  string.gsub(/[^a-z]/, ' ').squeeze(' ')
end

cleanup("---what's my +*& line?") == ' what s my line '