class HashMap
  attr_accessor :bucket
  attr_reader :size

  def initialize(size = 16)
    @size = size
    @bucket = Array.new(size)
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

    bucket[index] = value
  end
end
