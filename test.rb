require_relative 'method.rb'

test_array_s = %w[ant bear cat]
p [1, 2i, 3.14].my_all?(Numeric)
p [1, 2i, 3.14].all?(Numeric)

puts "*************"
p [nil, true, 99].my_all?
p [nil, true, 99].all?

puts "************"
p [].my_all?
p [].all?

puts "************"

p %w[ant bear cat].my_all?(/a/)
p %w[ant bear cat].all?(/a/)

puts "************"

x = test_array_s.my_all? { |word| word.length >= 3 }
puts "my_all result is : #{x}"

x = test_array_s.all? { |word| word.length >= 3 }
puts "my_all result is : #{x}"

puts "************"

x = test_array_s.my_all?(/a/) { |word| word.length >= 3 }
puts "my_all result is : #{x}"

x = test_array_s.all?(/a/) { |word| word.length >= 3 }
puts "my_all result is : #{x}"