module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method

class Array
  # Define my_each here
  def my_each
    for element in self
      yield element
    end
    self
  end

  def my_each_with_index
    idx = 0
    my_each do |element|
      yield element, idx
      idx += 1
    end
    self
  end

  def my_all?
    all_true = true
    my_each { |element| all_true = false unless yield element }
    all_true
  end

  def my_any?
    any_true = false
    my_each { |element| any_true = true if yield element }
    any_true
  end

  def my_none?
    any_true = true
    my_each {|element| any_true = false if yield element }
    any_true
  end

  def my_count
    count = 0
    if block_given?
      my_each { |element| count += 1 if yield element }
    else
      my_each { count += 1 }
    end
    count
  end

  def my_map
    new_arr = []
    my_each { |element| new_arr.push(yield element) }
    new_arr
  end

  def my_inject(initial_value = nil)
    initial_value.nil? ? memo = self[0] : memo = initial_value
    my_each do |element|
      memo = yield memo, element
    end
    memo
  end
end
