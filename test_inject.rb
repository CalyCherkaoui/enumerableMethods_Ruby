require_relative 'method.rb'
test_array_s = %w[ant bear cat]
test_array_i = [1, 2, 3]

puts 'inject symbol , no init , no block ________'

p test_array_i.my_inject(:+)
p test_array_i.inject(:+)
puts '**'
p test_array_s.my_inject(:+)
p test_array_s.inject(:+)

puts 'inject symbol , init , no block ________'

p test_array_i.my_inject(2, :+)
p test_array_i.inject(2, :+)
puts '**'
p test_array_s.my_inject('w', :+)
p test_array_s.inject('w', :+)

puts 'inject symbol , init , block ________'

p test_array_i.my_inject(2, :+) { |x, y| x * y }
p test_array_i.inject(2, :+) { |x, y| x * y }

puts 'inject no symbol , init , block ________'

p test_array_i.my_inject(2) { |x, y| x * y }
p test_array_i.inject(2) { |x, y| x * y }

puts 'inject no symbol , no init , no block ________'

p test_array_i.my_inject
# p test_array_i.inject

puts 'inject no symbol , init , no block ________'

p test_array_i.my_inject(2)
# p test_array_i.inject(2)

puts 'inject no symbol , no init , block ________'

a = test_array_i.my_inject { |x, y| x * y }
p a
b = test_array_i.inject { |x, y| x * y }
p b
