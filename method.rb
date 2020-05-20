module Enumerable
  def my_each (array)
    i = 0
    while i < array.length
      yield array[i]
      i += 1
    end
    array
  end

  def my_each_with_index (array)
    i = 0
    while i < array.length
      yield array[i] , i
      i += 1
    end
    return array
  end

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

  def my_select_with_index (array)
    output_array = []
    i = 0
    while i < array.length
      if (yield i) == true
        output_array << i
      end
      i += 1
    end
    output_array
  end

  def my_all? (array)
    status_cumulator = true
    i = 0
    loop do
      status_cumulator = status_cumulator && (yield i)
      i += 1
      break if (i == array.length || status_cumulator == false )
    end
    status_cumulator
  end

  def my_any? (array)
    status_cumulator = false
    i = 0
    while i < array.length
        status_cumulator = status_cumulator || (yield i)
        i += 1
    end
    status_cumulator
  end

  def my_none? (array)
    status_cumulator = true
    i = 0
    while i < array.length
        status_cumulator = status_cumulator && (yield i)
        i += 1
    end
    !status_cumulator
  end

end

include Enumerable

test_array = (1...7).to_a

# -----my_each method-----
my_each (test_array) do |item|
  puts "my_each #{item}"
end

# -----my_each_with_index method-----

my_each_with_index (test_array) do |item , inx|
  item = inx * 2
  puts "my_each_with_index #{item}"
end

# -----my_select method-----

x = my_select (test_array) do |indx|
  if test_array[indx] % 2 == 0
    true
  else
    false
  end
end
puts "my_select result is : #{x}"

# -----my_select_with_index method-----

x = my_select_with_index (test_array) do |indx|
  if test_array[indx] > 3
    true
  else
    false
  end
end
puts "my_select_with_index result is : #{x}"

# -----my_all? method-----

x = my_all? (test_array) do |indx|
  if test_array[indx] > 20
    true
  else
    false
  end
end

puts "my_all result is : #{x}"

# -----my_any? method-----

x = my_any? (test_array) do |indx|
  if test_array[indx] >= 6
    true
  else
    false
  end
end

puts "my_any? result is : #{x}"

# -----my_none? method-----

x = my_none? (test_array) do |indx|
  if test_array[indx] > 20
    true
  else
    false
  end
end

puts "my_none? result is : #{x}"
