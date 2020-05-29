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

  def my_all?(parameter = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    status_cumulator = true
    i = 0
    if block_given?
      case parameter
      when nil
        loop do
          status_cumulator &&= yield self[i]
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      when parameter.is_a?(Regexp)
        puts "warning: given block not used"
        loop do
          status_cumulator &&= !parameter.match(self[i]).nil?
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      when parameter.is_a?(Class)
        puts "warning: given block not used"
        loop do
          status_cumulator &&= self[i].is_a?(parameter)
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      else
        puts "warning: given block not used"
        loop do
          status_cumulator &&= (self[i] == parameter)
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      end
    else
      case parameter
      when nil
        loop do
          status_cumulator &&= !self[i].nil?
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      when parameter.is_a?(Regexp)
        loop do
          status_cumulator &&= !parameter.match(self[i]).nil?
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      when parameter.is_a?(Class)
        loop do
          status_cumulator &&= self[i].is_a?(parameter)
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      else
        loop do
          status_cumulator &&= (self[i] == parameter)
          i += 1
          break if i == size || status_cumulator == false
        end
        return status_cumulator
      end
    end
  end

  def my_any?(parameter = nil) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    status_cumulator = false
    i = 0
    loop do
      if block_given?
        status_cumulator ||= yield self[i]
      elsif parameter.is_a?(Regexp)
        status_cumulator ||= !parameter.match(self[i]).nil?
      elsif parameter.is_a?(Class)
        status_cumulator ||= self[i].is_a?(parameter)
      elsif parameter
        status_cumulator ||= (self[i] == parameter)
      else
        status_cumulator = true
      end
      i += 1
      break if i == size || status_cumulator == true
    end
    status_cumulator
  end

  def my_none?(parameter = nil)
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

  def my_map(&proc)
    output_array = []
    if block_given?
      my_each do |elem|
        output_array << (yield elem)
      end
    else
      my_each do |elem|
        output_array << proc.call(elem)
      end
    end
    output_array
  end
end
