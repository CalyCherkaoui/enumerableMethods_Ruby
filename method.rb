module Enumerable
  def my_each
    #return "no block given" unless block_given?
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield self[i] , i
      i += 1
    end
    return self
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
    loop do
      status_cumulator = status_cumulator || (yield i)
      i += 1
      break if (i == array.length || status_cumulator == true )
    end
    status_cumulator
  end

  def my_none? (array)
    status_cumulator = true
    i = 0
    loop do
      status_cumulator = status_cumulator && (yield i)
      i += 1
      break if (i == array.length || status_cumulator == false )
    end
    !status_cumulator
  end

  # def my_count (array)
  #   counter = 0
  #   i = 0
  #   while i < array.length
  #     if yield i
  #       counter += 1
  #     end
  #   end
  #   counter
  # end

end

include Enumerable

test_array = (1...7).to_a

# -----Testing my_each method-----

test_array.my_each do |item|
  puts "my_each #{item}"
end

# -----Testing my_each_with_index method-----

test_array.my_each_with_index do |item , inx|
  item = inx * 2
  puts "my_each_with_index #{item}"
end

# -----Testing my_select method-----

x = my_select (test_array) do |indx|
  if test_array[indx] % 2 == 0
    true
  else
    false
  end
end
puts "my_select result is : #{x}"

# -----Testing my_select_with_index method-----

x = my_select_with_index (test_array) do |indx|
  if test_array[indx] > 3
    true
  else
    false
  end
end
puts "my_select_with_index result is : #{x}"

# -----Testing my_all? method-----

x = my_all? (test_array) do |indx|
  if test_array[indx] > 20
    true
  else
    false
  end
end
puts "my_all result is : #{x}"

# -----Testing my_any? method-----

x = my_any? (test_array) do |indx|
  if test_array[indx] >= 6
    true
  else
    false
  end
end

puts "my_any? result is : #{x}"

# -----Testing my_none? method-----

x = my_none? (test_array) do |indx|
  if test_array[indx] > 20
    true
  else
    false
  end
end
puts "my_none? result is : #{x}"

# -----Testing my_count method-----

# x = my_count (test_array) do |indx|
#   if test_array[indx] < 2
#     true
#   else
#     false
#   end
# end

# puts "my_count result is : #{x}"
