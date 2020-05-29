require_relative 'method.rb'
puts ' O *************'
test_array_s = %w[ant bear cat]
p [1, 2i, 3.14].my_none?(Numeric)
p [1, 2i, 3.14].none?(Numeric)

puts ' A *************'
p [nil, true, 99].my_none?
p [nil, true, 99].none?

puts ' B ************'
p [].my_none?
p [].none?

puts ' C ************'

p %w[ant bear cat].my_none?(/a/)
p %w[ant bear cat].none?(/a/)

puts ' D ************'

x = test_array_s.my_none? { |word| word.length >= 3 }
puts "my_none result is : #{x}"

x = test_array_s.none? { |word| word.length >= 3 }
puts "my_none result is : #{x}"

puts ' E ************'

x = test_array_s.my_none?(/a/) { |word| word.length >= 3 }
puts "my_none result is : #{x}"

x = test_array_s.none?(/a/) { |word| word.length >= 3 }
puts "my_none result is : #{x}"

puts ' F ************'

p [1, 2].my_none?
p [1, 3].none?
