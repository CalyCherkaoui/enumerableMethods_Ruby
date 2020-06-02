module Enumerable # rubocop:disable Metrics/ModuleLength
  def my_each
    return to_enum(:my_each) unless block_given?

    output_array = is_a?(Array) ? self : to_a
    i = 0
    while i < size
      yield output_array[i]
      i += 1
    end
    output_array
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    output_array = is_a?(Array) ? self : to_a
    i = 0
    while i < size
      yield output_array[i], i
      i += 1
    end
    output_array
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    output_array = []
    my_each do |item|
      output_array << item if (yield item) == true
    end
    output_array
  end

  def parameter_condition?(parameter)
    parameter.is_a?(Regexp) || parameter.is_a?(Class) || parameter.nil?
  end

  def my_all?(parameter = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/AbcSize
    status_cumulator = true
    i = 0
    bg = block_given?
    if bg == true && parameter.nil?
      loop do
        status_cumulator &&= yield self[i]
        i += 1
        break if i == size || status_cumulator == false
      end
    elsif bg == true && parameter.is_a?(Regexp)
      puts 'warning: given block not used'
      loop do
        status_cumulator &&= !parameter.match(self[i]).nil?
        i += 1
        break if i == size || status_cumulator == false
      end
    elsif bg == true && parameter.is_a?(Class)
      puts 'warning: given block not used'
      loop do
        status_cumulator &&= self[i].is_a?(parameter)
        i += 1
        break if i == size || status_cumulator == false
      end
    elsif bg == true && parameter_condition?(parameter)
      puts 'warning: given block not used'
      loop do
        status_cumulator &&= (self[i] == parameter)
        i += 1
        break if i == size || status_cumulator == false
      end
    elsif bg == false && parameter.nil?
      loop do
        break if i == size || status_cumulator == false

        status_cumulator &&= !self[i].nil?
        i += 1
      end
    elsif bg == false && parameter.is_a?(Regexp)
      loop do
        status_cumulator &&= !parameter.match(self[i]).nil?
        i += 1
        break if i == size || status_cumulator == false
      end
    elsif bg == false && parameter.is_a?(Class)
      loop do
        status_cumulator &&= self[i].is_a?(parameter)
        i += 1
        break if i == size || status_cumulator == false
      end
    else
      loop do
        status_cumulator &&= (self[i] == parameter)
        i += 1
        break if i == size || status_cumulator == false
      end
    end
    status_cumulator
  end

  def my_any?(parameter = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength, Metrics/AbcSize
    status_cumulator = false
    i = 0
    bg = block_given?
    if bg == true && parameter.nil?
      loop do
        status_cumulator ||= yield self[i]
        i += 1
        break if i == size || status_cumulator == true
      end
    elsif bg == true && parameter.is_a?(Regexp)
      puts 'warning: given block not used'
      loop do
        status_cumulator ||= !parameter.match(self[i]).nil?
        i += 1
        break if i == size || status_cumulator == true
      end
    elsif bg == true && parameter.is_a?(Class)
      puts 'warning: given block not used'
      loop do
        status_cumulator ||= self[i].is_a?(parameter)
        i += 1
        break if i == size || status_cumulator == true
      end
    elsif bg == true && parameter_condition?(parameter)
      puts 'warning: given block not used'
      loop do
        status_cumulator ||= (self[i] == parameter)
        i += 1
        break if i == size || status_cumulator == true
      end
    elsif bg == false && parameter.nil?
      loop do
        break if i == size || status_cumulator == true

        status_cumulator ||= !self[i].nil?
        i += 1
      end
    elsif bg == false && parameter.is_a?(Regexp)
      loop do
        status_cumulator ||= !parameter.match(self[i]).nil?
        i += 1
        break if i == size || status_cumulator == true
      end
    elsif bg == false && parameter.is_a?(Class)
      loop do
        status_cumulator ||= self[i].is_a?(parameter)
        i += 1
        break if i == size || status_cumulator == true
      end
    else
      loop do
        status_cumulator ||= (self[i] == parameter)
        i += 1
        break if i == size || status_cumulator == true
      end
    end
    status_cumulator
  end

  def my_none?(parameter = nil, &block)
    !my_any?(parameter)
  end

  def my_count(parameter = nil)
    counter = 0
    if parameter
      my_each { |item| counter += 1 if item == parameter }
      counter
    elsif block_given?
      my_each { |item| counter += 1 if yield item }
      counter
    else
      size
    end
  end

  def my_inject(parameter = nil)
    return to_enum(:my_inject) unless block_given?

    output_array = is_a?(Array) ? self : to_a
    if parameter
      cumulator = parameter
      i = 0
    else
      cumulator = output_array[0]
      i = 1
    end
    while i < size
      cumulator = yield cumulator, output_array[i]
      i += 1
    end
    cumulator
  end

  def my_map (my_proc = nil)
    output_array = []
    if my_proc.is_a?(Proc)
      puts "proc"
      my_each do |elem|
        output_array << my_proc.call(elem)
      end
    elsif !my_proc.is_a?(Proc) && !block_given?
      return to_enum(:my_map)
    elsif !my_proc.is_a?(Proc) && block_given?
      puts "block"
      my_each do |elem|
        output_array << (yield elem)
      end
    else
      puts "warning arguments : wrong"
    end
    output_array
  end

end

# # -----Testing my_inject method with multiply_els method---
# test_array_i = (1...5).to_a
# def multiply_els(array)
#   array.my_inject do |m, n|
#     (m * n)
#   end
# end
# x = multiply_els(test_array_i)
# puts "Testing my_inject method with multiply_els method. The result is : #{x}"

# test_array_x = (1...5).to_a
# def multiply_els(array)
#   array.inject do |m, n|
#     (m * n)
#   end
# end
# x = multiply_els(test_array_x)
# puts "Testing inject method with multiply_els method. The result is : #{x}"