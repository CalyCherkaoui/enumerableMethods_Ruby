module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < size
      yield self[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < size
      yield self[i], i
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    output_array = []
    i = 0
    while i < size
      output_array << self[i] if (yield i) == true
      i += 1
    end
    output_array
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    status_cumulator = true
    i = 0
    loop do
      status_cumulator &&= yield i
      i += 1
      break if i == size || status_cumulator == false
    end
    status_cumulator
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    status_cumulator = false
    i = 0
    loop do
      status_cumulator ||= yield i
      i += 1
      break if i == size || status_cumulator == true
    end
    status_cumulator
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    status_cumulator = true
    i = 0
    loop do
      status_cumulator &&= yield i
      i += 1
      break if i == size || status_cumulator == false
    end
    !status_cumulator
  end

  def my_count
    return size unless block_given?

    counter = 0
    i = 0
    while i < size
      counter += 1 if yield self[i]
      i += 1
    end
    counter
  end

  def my_inject
    return to_enum(:my_inject) unless block_given?

    cumulator = self[0]
    i = 1
    while i < size
      cumulator = yield cumulator, self[i]
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
