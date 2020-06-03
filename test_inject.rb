require_relative 'method.rb'
test_array_s = %w[ant bear cat]
test_array_i = [1, 2, 3]

puts 'inject integer________'

p test_array_i.my_inject(:+)
p test_array_i.inject(:+)