require_relative 'linked_list'

class HashMap
  attr_reader :size
  attr_accessor :buckets

  def initialize(size = 16)
    @size = size
    @buckets = Array.new(size) { LinkedList.new }
    @count = 0
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
      @count += 1
    # elsif buckets[index].has?(key)
    else
      buckets[index].append(key, value)
    end
  end

  def get(key)
    hash_code = hash(key)
    index = hash_code % size

    buckets[index]
  end

  def has?(key)
    hash_code = hash(key)
    index = hash_code % size

    !buckets[index].head.nil?
  end

  def remove(key)
    hash_code = hash(key)
    index = hash_code % size

    if has?(key)
      result = buckets[index]
      buckets[index] = nil
      @count -= 1
      result
    else
      nil
    end
  end

  def length
    @count
  end

  def clear
    @buckets.map! { nil }
    nil
  end
end
