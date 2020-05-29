require_relative 'method.rb'
test_array_s = %w[ant bear cat]
p [1, 2i, 3.14].my_all?(Numeric)
p [nil, true, 99].my_all?
p [].my_all?
p %w[ant bear cat].my_all?(/a/)

x = test_array_s.my_all? { |word| word.length >= 3 }
puts "my_all result is : #{x}"
