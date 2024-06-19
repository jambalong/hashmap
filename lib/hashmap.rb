# frozen_string_literal: true

require_relative 'linked_list'

# This is a HashMap Data Structure class
class HashMap
  attr_reader :size
  attr_accessor :buckets, :length

  LOAD_FACTOR = 0.75

  def initialize(size = 16)
    @size = size
    @buckets = Array.new(size)
    @length = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code % size
  end

  def set(key, value)
    hash = hash(key)

    buckets[hash] ||= LinkedList.new

    index = buckets[hash].find(key)

    if index
      buckets[hash].insert_at(key, value, index)
    elsif load_factor?
      grow_size
      set(key, value)
    else
      buckets[hash].append(key, value)
      self.length += 1
    end
  end

  def load_factor?
    return true if (length / size) > LOAD_FACTOR

    false
  end

  def grow_size
    old_entries = entries
    self.length = 0

    self.buckets = Array.new(size * 2)
    old_entries.each { |key, value| set(key, value) }

    self
  end

  def get(key)
    hash = hash(key)

    buckets[hash]
  end

  def has?(key)
    hash = hash(key)

    !buckets[hash]&.head.nil?
  end

  def remove(key)
    hash = hash(key)

    return unless has?(key)

    result = buckets[hash]
    buckets[hash] = nil
    self.length -= 1
    result
  end

  def clear
    buckets.map! { nil }
    self.length = 0

    nil
  end

  def keys
    keys = []
    buckets.each { |bucket| keys << bucket&.head&.key }

    keys.compact
  end

  def values
    values = []
    buckets.each { |bucket| values << bucket&.head&.value }

    values.compact
  end

  def entries
    entries = ->(bucket) { [bucket&.head&.key, bucket&.head&.value] }
    buckets.map(&entries).reject { |entry| entry.include?(nil) }
  end

  def to_s
    buckets.each { |bucket| puts bucket }
  end
end
