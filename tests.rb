require_relative 'method.rb'

test_array = (1...5).to_a
test_array_i = (1...5).to_a
test_array_s = %w[ant bear cat]
test_array_v = [nil, true, 99]
test_array_f = [1, 3.14, 42]
test_array_b = [nil, false, true]
test_array_h = %w{ant bear cat}

# -----Testing my_each method-----

test_array_i.my_each do |item|
  puts "my_each #{item}"
end

test_array_s.my_each do |item|
  puts "my_each #{item}"
end

# -----Testing my_each_with_index method-----

test_array_f.my_each_with_index do |item, indx|
  item.to_i << indx % 3
  puts "my_each_with_index #{item}"
end
hash1 = Hash.new
test_array_s.my_each_with_index do |item, indx|
  hash1[item] = indx
end
puts "my_each_with_index #{hash1}"

# -----Testing my_select method-----

x = [1,2,3,4,5].my_select{|a| a.even? }
puts "my_select result is : #{x} selecting the even values"

# # -----Testing my_all? method-----

# x = test_array.my_all? do |indx|
#   test_array[indx] > 20
# end
# puts "my_all result is : #{x}"

# # -----Testing my_any? method-----

# x = test_array.my_any? do |indx|
#   test_array[indx] >= 6
# end

# puts "my_any? result is : #{x}"

# # -----Testing my_none? method-----

# x = test_array.my_none? do |indx|
#   test_array[indx] > 20
# end
# puts "my_none? result is : #{x}"

# # -----Testing my_count method-----

# x = test_array.my_count { |item| item < 2 }

# puts "my_count result is : #{x}"

# # -----Testing my_inject method-----

# x = test_array.my_inject do |m, n|
#   (m * n)
# end

# puts "my_inject result is : #{x}"

# # -----Testing my_inject method with multiply_els method---

# def multiply_els(array)
#   array.my_inject do |m, n|
#     (m * n)
#   end
# end
# x = multiply_els(test_array)
# puts "Testing my_inject method with multiply_els method. The result is : #{x}"

# # -----Testing my_map method-----
# x = test_array.my_map do |item|
#   (item * 10)
# end
# puts "my_map with block result is : #{x}"

# test_proc = proc { |item| item * 20 }
# x = test_array.my_map(&test_proc)
# puts "my_map with proc result is : #{x}"