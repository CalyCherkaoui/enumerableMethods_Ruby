module Enumerable
  def my_each
    return "no block given" unless block_given?
    i = 0
    while i < self.length
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    return "no block given" unless block_given?
    i = 0
    while i < self.length
      yield self[i] , i
      i += 1
    end
    return self
  end

  def my_select
    return "no block given" unless block_given?
    output_array = []
    i = 0
    while i < self.length
      if (yield i) == true
        output_array << self[i]
      end
      i += 1
    end
    output_array
  end

  def my_select_with_index
    return "no block given" unless block_given?
    output_array = []
    i = 0
    while i < self.length
      if (yield i) == true
        output_array << i
      end
      i += 1
    end
    output_array
  end

  def my_all?
    return "no block given" unless block_given?
    status_cumulator = true
    i = 0
    loop do
      status_cumulator = status_cumulator && (yield i)
      i += 1
      break if (i == self.length || status_cumulator == false )
    end
    status_cumulator
  end

  def my_any?
    return "no block given" unless block_given?
    status_cumulator = false
    i = 0
    loop do
      status_cumulator = status_cumulator || (yield i)
      i += 1
      break if (i == self.length || status_cumulator == true )
    end
    status_cumulator
  end

  def my_none?
    return "no block given" unless block_given?
    status_cumulator = true
    i = 0
    loop do
      status_cumulator = status_cumulator && (yield i)
      i += 1
      break if (i == self.length || status_cumulator == false )
    end
    !status_cumulator
  end

  def my_count
    return self.size unless block_given?
    counter = 0
    i = 0
    while i < self.size
      if (yield self[i])
        counter += 1
      end
      i += 1
    end
    counter
  end

  def my_map
    return "no block given" unless block_given?
    output_array = []
    self.my_each do |elem|
      output_array << (yield elem)
    end
    output_array
  end

  def my_inject
    return "no block given" unless block_given?
  end

end


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

x = test_array.my_select do |indx|
  if test_array[indx] % 2 == 0
    true
  else
    false
  end
end
puts "my_select result is : #{x}"

# -----Testing my_select_with_index method-----

x = test_array.my_select_with_index do |indx|
  if test_array[indx] > 3
    true
  else
    false
  end
end
puts "my_select_with_index result is : #{x}"

# -----Testing my_all? method-----

x = test_array.my_all? do |indx|
  if test_array[indx] > 20
    true
  else
    false
  end
end
puts "my_all result is : #{x}"

# -----Testing my_any? method-----

x = test_array.my_any? do |indx|
  if test_array[indx] >= 6
    true
  else
    false
  end
end

puts "my_any? result is : #{x}"

# -----Testing my_none? method-----

x = test_array.my_none? do |indx|
  if test_array[indx] > 20
    true
  else
    false
  end
end
puts "my_none? result is : #{x}"

# -----Testing my_count method-----

x = test_array.my_count do |item|
  if item < 2
    true
  else
    false
  end
end

puts "my_count result is : #{x}"

# -----Testing my_count method-----

x = test_array.my_map do |item|
  (item * 10)
end

puts "my_map result is : #{x}"
