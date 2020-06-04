require_relative 'method.rb'
puts ' O *************'
test_array_s = %w[ant bear cat]
p [1, 2i, 3.14].my_any?(Numeric)
p [1, 2i, 3.14].any?(Numeric)

puts ' A *************'
p [nil, true, '', nil].my_any?
p [nil, true, '', nil].any?

puts ' B ************'
p [].my_any?
p [].any?

puts ' C ************'

p %w[ant bear cat].my_any?(/a/)
p %w[ant bear cat].any?(/a/)

puts ' D ************'

x = test_array_s.my_any? { |word| word.length >= 3 }
puts "my_any result is : #{x}"

x = test_array_s.any? { |word| word.length >= 3 }
puts "any result is : #{x}"

puts ' E ************'

x = test_array_s.my_any?(/a/) { |word| word.length >= 3 }
puts "my_any result is : #{x}"

x = test_array_s.any?(/a/) { |word| word.length >= 3 }
puts "my_any result is : #{x}"

puts ' F ************'

p [1, 2].my_any?
p [1, 3].any?
