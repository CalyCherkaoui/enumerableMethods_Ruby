test_array = (1...7).to_a
# p test_array.select {|x| x > 3}
# print test_array

# -----my_each method-----

def my_each (array)
  i = 0
  while i < array.length
    yield array[i]
    i += 1
  end
  array
end

my_each (test_array) do |item|
  puts "my_each #{item}"
end

# -----my_each_with_index method-----

def my_each_with_index (array)
  i = 0
  while i < array.length
    yield array[i] , i
    i += 1
  end
  return array
end

my_each_with_index (test_array) do |item , inx|
  item = inx * 2
  puts "my_each_with_index #{item}"
end

# -----my_select method-----

def my_select (array)
  output_array = []
  i = 0
  while i < array.length
    if (yield i) == true
      output_array << array[i]
    end
    i += 1
  end
  puts "my_select #{output_array}"
end

my_select (test_array) do |indx|
  if test_array[indx] % 2 == 0
    true
  else
    false
  end
end

# -----my_select_with_index method-----

def my_select_with_index (array)
  output_array = []
  i = 0
  while i < array.length
    if (yield i) == true
      output_array << i
    end
    i += 1
  end
  puts "my_select_with_index #{output_array}"
end

my_select_with_index (test_array) do |indx|
  if test_array[indx] > 3
    true
  else
    false
  end
end

# -----my_all? method-----

def my_all? (array)
  status_cumulator = true
  i = 0
  while i < array.length
      status_cumulator = status_cumulator && (yield i)
      i += 1
  end
  puts status_cumulator
end

my_all? (test_array) do |indx|
  if test_array[indx] > 20
    true
  else
    false
  end
end

# -----my_any? method-----

def my_any? (array)
  status_cumulator = false
  i = 0
  while i < array.length
      status_cumulator = status_cumulator || (yield i)
      i += 1
  end
  puts status_cumulator
end
