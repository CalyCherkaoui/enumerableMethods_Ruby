# def my_each (array)
#   i = 0
#   while i < array.length
#     yield array[i]
#     i += 1
#   end
#   return array
# end

test_array = (1...7).to_a
# print test_array

# my_each (test_array) do |item|
#   print item
# end

# def my_each_with_index (array)
#   i = 0
#   while i < array.length
#     yield array[i] , i
#     i += 1
#   end
#   return array
# end

# my_each_with_index (test_array) do |item , inx|
#   item = inx * 2
#   puts item
# end

def my_select (array)
  output_array = []
  i = 0
  while i < array.length
    if (yield i) == true
      output_array << array[i]
    end
    i += 1
  end
  output_array
end

my_select (test_array) do |indx|
  if test_array[indx] % 2 == 0
    print indx
    true
  else
    false
  end
end
