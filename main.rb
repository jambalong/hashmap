require_relative 'lib/hashmap'

hashmap = HashMap.new

hashmap.set('Carlos', 'I am the old value')
hashmap.set('Carlos', 'I am the new value')
p hashmap
