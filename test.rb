require_relative 'method.rb'
puts ' O *************'
test_array_s = %w[ant bear cat]
p [1, 2i, 3.14].my_all?(Numeric)
p [1, 2i, 3.14].all?(Numeric)

puts ' A *************'
p [nil, true, 99].my_all?
p [nil, true, 99].all?

puts ' B ************'
p [].my_all?
p [].all?

puts ' C ************'

p %w[ant bear cat].my_all?(/a/)
p %w[ant bear cat].all?(/a/)

puts ' D ************'

x = test_array_s.my_all? { |word| word.length >= 3 }
puts "my_all result is : #{x}"

x = test_array_s.all? { |word| word.length >= 3 }
puts "my_all result is : #{x}"

puts ' E ************'

x = test_array_s.my_all?(/a/) { |word| word.length >= 3 }
puts "my_all result is : #{x}"

x = test_array_s.all?(/a/) { |word| word.length >= 3 }
puts "my_all result is : #{x}"

puts ' F ************'

p [1, 2].my_all?(nil)
p [1, 2].all?(nil)

puts ' g ************'

p [nil].my_all?
p [nil].all?

puts ' h ************'

p [2].my_all?(false)
p [2].all?(false)
