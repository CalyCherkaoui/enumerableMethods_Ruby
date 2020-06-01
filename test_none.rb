require_relative 'method.rb'
test_array_s = %w[ant bear cat]
p [1, 2i, 3.14].my_none?(Numeric) {|x| puts x}
p [1, 2i, 3.14].none?(Numeric) {|x| puts x}
puts "*****"
p [nil, true, 99].my_none?
p [nil, true, 99].none?
p [].my_none?
p [].none?
p %w[ant bear cat].my_none?(/a/)
p %w[ant bear cat].none?(/a/)
x = test_array_s.my_none? { |word| word.length >= 3 }
puts "my_none result is : #{x}"
x = test_array_s.none? { |word| word.length >= 3 }
puts "none result is : #{x}"
puts "********"
x = test_array_s.my_none?(/a/) { |word| word.length >= 3 }
puts "my_none result is : #{x}"

x = test_array_s.none?(/a/) { |word| word.length >= 3 }
puts "none result is : #{x}"