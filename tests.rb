require_relative 'method.rb'
test_range = (5..10)
test_hash = { 'one' => 1, 'two' => 2, 'three' => 3 }
test_array_i = (1...5).to_a
test_array_s = %w[ant bear cat]
test_array_f = [1, 3.14, 42]

puts '-----Testing my_each method-----'

test_array_f.my_each do |item|
  puts "my_each float #{item}"
end

test_hash.my_each do |item|
  puts "my_each hash #{item}"
end

test_array_s.my_each do |item|
  puts "my_each string #{item}"
end

test_range.my_each do |item|
  puts "my_each range #{item}"
end

puts '-----Testing my_each_with_index method-----'

test_array_f.my_each_with_index do |item, indx|
  item.to_i << indx % 3
  puts "my_each_with_index #{item}"
end
hash1 = {}
test_array_s.my_each_with_index do |item, indx|
  hash1[item] = indx
end
puts "my_each_with_index #{hash1}"

puts '-----Testing my_select method-----'

x = test_array_i.my_select { |a| (a % 2).zero? }
puts "my_select result is : #{x} selecting even values"

puts '-----Testing my_all? method-----'

x = test_array_s.my_all? { |word| word.length >= 3 }
puts "my_all result is : #{x}"

puts '-----Testing my_count method-----'

x = test_array_i.my_count { |item| item < 2 }
puts "my_count with block result is : #{x}"

x = test_array_i.my_count(2)
puts "my_count with argument result is : #{x}"

puts '-----Testing my_inject method-----'

x = test_array_i.my_inject do |m, n|
  (m * n)
end
puts "my_inject result is : #{x}"

x = test_range.my_inject(1) { |product, n| product * n }

puts "my_inject with initial argument result  is : #{x}"

puts '-----Testing my_inject method with multiply_els method---'

def multiply_els(array)
  array.my_inject do |m, n|
    (m * n)
  end
end
x = multiply_els(test_array_i)
puts "Testing my_inject method with multiply_els method. The result is : #{x}"

puts 'just block-----Testing my_map method-----'
x = test_array_i.my_map do |item|
  (item * 10)
end
puts "my_map with block result is : #{x}"

x = test_array_i.map do |item|
  (item * 10)
end
puts "map with block result is : #{x}"
puts 'just proc ----------'
test_proc = proc { |item| item * 10 }
x = test_array_i.my_map(&test_proc)
puts "my_map with proc result is : #{x}"
test_proc = proc { |item| item * 10 }
x = test_array_i.map(&test_proc)
puts "map with proc result is : #{x}"

puts '------'

x = test_array_i.my_map
puts "my_map without any block nor proc result is : #{x}"
x = test_array_i.map
puts "map without any block nor proc result is : #{x}"

puts '------'

# x = test_array_i.my_map(&test_proc) do |item|
#   (item * 10)
# end
# puts "my_map with block result is : #{x}"

# x = test_array_i.map(&test_proc) do |item|
#   (item * 10)
# end
# puts "map with block result is : #{x}"
