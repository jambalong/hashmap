# frozen_string_literal: true

# Represents a node in a linked list
class Node
  attr_accessor :key, :value, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next = next_node
  end
end
