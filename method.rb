module Enumerable
  def my_each
    return 'no block given' unless block_given?

    i = 0
    while i < size
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    return 'no block given' unless block_given?

    i = 0
    while i < size
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    return 'no block given' unless block_given?

    output_array = []
    i = 0
    while i < size
      output_array << self[i] if (yield i) == true
      i += 1
    end
    output_array
  end

  def my_all?
    return 'no block given' unless block_given?

    status_cumulator = true
    i = 0
    loop do
      status_cumulator &&= yield i
      i += 1
      break if i == size || status_cumulator == false
    end
    status_cumulator
  end

  def my_any?
    return 'no block given' unless block_given?

    status_cumulator = false
    i = 0
    loop do
      status_cumulator ||= yield i
      i += 1
      break if i == size || status_cumulator == true
    end
    status_cumulator
  end

  def my_none?
    return 'no block given' unless block_given?

    status_cumulator = true
    i = 0
    loop do
      status_cumulator &&= yield i
      i += 1
      break if i == size || status_cumulator == false
    end
    !status_cumulator
  end

  def my_count
    return size unless block_given?

    counter = 0
    i = 0
    while i < size
      counter += 1 if yield self[i]
      i += 1
    end
    counter
  end

  def my_inject
    return 'no block given' unless block_given?

    cumulator = self[0]
    i = 1
    while i < size
      cumulator = yield cumulator, self[i]
      i += 1
    end
    cumulator
  end

  def my_map(&proc)
    output_array = []
    if block_given?
      my_each do |elem|
        output_array << (yield elem)
      end
    else
      my_each do |elem|
        output_array << proc.call(elem)
      end
    end
    output_array
  end
end

test_array = (3...7).to_a

# -----Testing my_each method-----

test_array.my_each do |item|
  puts "my_each #{item}"
end

# -----Testing my_each_with_index method-----

test_array.my_each_with_index do |item, indx|
  item << indx % 3
  puts "my_each_with_index #{item}"
end

# -----Testing my_select method-----

x = test_array.my_select do |indx|
  (test_array[indx] % 2).zero?
end
puts "my_select result is : #{x}"

# -----Testing my_all? method-----

x = test_array.my_all? do |indx|
  test_array[indx] > 20
end
puts "my_all result is : #{x}"

# -----Testing my_any? method-----

x = test_array.my_any? do |indx|
  test_array[indx] >= 6
end

puts "my_any? result is : #{x}"

# -----Testing my_none? method-----

x = test_array.my_none? do |indx|
  test_array[indx] > 20
end
puts "my_none? result is : #{x}"

# -----Testing my_count method-----

x = test_array.my_count { |item| item < 2 }

puts "my_count result is : #{x}"

# -----Testing my_inject method-----

x = test_array.my_inject do |m, n|
  (m * n)
end

puts "my_inject result is : #{x}"

# -----Testing my_inject method with multiply_els method---

def multiply_els(array)
  array.my_inject do |m, n|
    (m * n)
  end
end
x = multiply_els(test_array)
puts "Testing my_inject method with multiply_els method. The result is : #{x}"

# -----Testing my_map method-----
x = test_array.my_map do |item|
  (item * 10)
end
puts "my_map with block result is : #{x}"

test_proc = proc { |item| item * 20 }
x = test_array.my_map(&test_proc)
puts "my_map with proc result is : #{x}"
