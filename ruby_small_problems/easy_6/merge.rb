#Init new_list
#add all items in list_1 to new_list
#for item in list_2
  #if not item in list_1, add item to list_1
#return new_list

def merge(list_1, list_2)
  new_list = []
  for item in list_1
    new_list << item
  end
  for item in list_2
    new_list << item unless new_list.include?(item)
  end
end

merge([1,2,3],[3,4,5])
