require_relative 'linked_list'

class HashMap
  attr_accessor :buckets
  attr_reader :size

  def initialize(size = 16)
    @size = size
    @buckets = Array.new(size) { LinkedList.new }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    hash_code = hash(key)
    index = hash_code % size

    if buckets[index].head.nil?
      buckets[index].prepend(key, value)
    # elsif buckets[index].has?(key)
    else
      buckets[index].append(key, value)
    end
  end
end
