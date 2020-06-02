require_relative 'method.rb'
test_array_i = (1...5).to_a

puts '_____array.map____no block , no proc___'

puts [1,2,3].my_map
puts [1,2,3].map

puts '_____array.map____ block , no proc___'

x = test_array_i.my_map do |item|
  (item * 10)
end
puts "my_map with block result is : #{x}"

x = test_array_i.map do |item|
  (item * 10)
end
puts "map with block result is : #{x}"

puts '_____array.map____ no block , proc___'

test_proc = Proc.new { |item| item * 20 }

x = test_array_i.my_map(test_proc)
puts "my_map with proc result is : #{x}"

# x = test_array_i.map(test_proc)
# puts "map with proc result is : #{x}"

puts '_____array.map____ block , proc___'

x = test_array_i.my_map(test_proc) do |item|
  (item * 10)
end
puts "my_map with block & proc result is : #{x}"

# x = test_array_i.map(test_proc) do |item|
#   (item * 10)
# end
# puts "map with block & proc result is : #{x}"

