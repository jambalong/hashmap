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
    key.each_char.reduce(0) { |hash, char| 31 * hash + char.ord } % size
  end

  def set(key, value)
    list = buckets[hash(key)] ||= LinkedList.new
    index = list.find(key)

    if index
      list.insert_at(key, value, index)
    elsif load_factor?
      grow_size
      set(key, value)
    else
      list.append(key, value)
      self.length += 1
    end
  end

  def get(key)
    buckets[hash(key)]
  end

  def has?(key)
    !buckets[hash(key)]&.head.nil?
  end

  def remove(key)
    return unless has?(key)

    hash = hash(key)
    buckets[hash].tap do
      buckets[hash] = nil
      self.length -= 1
    end
  end

  def clear
    self.buckets = Array.new(size)
    self.length = 0

    nil
  end

  def keys
    buckets.map { |bucket| bucket&.head&.key }.compact
  end

  def values
    buckets.map { |bucket| bucket&.head&.value }.compact
  end

  def entries
    entries = ->(bucket) { [bucket&.head&.key, bucket&.head&.value] }
    buckets.map(&entries).reject { |entry| entry.include?(nil) }
  end

  private

  def grow_size
    old_entries = entries
    self.buckets = Array.new(size * 2)
    self.length = 0

    old_entries.each { |key, value| set(key, value) }

    self
  end

  def load_factor?
    (length / size) > LOAD_FACTOR
  end

  def to_s
    buckets.each { |bucket| puts bucket }
  end
end
