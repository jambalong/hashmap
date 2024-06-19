require_relative 'lib/hashmap'
require 'pry-byebug'

hashmap = HashMap.new

hashmap.set('name', 'Carlos')
hashmap.set('age', 25)
hashmap.set('job', 'Analyst')
hashmap.set('mobile', '222-1111')

puts <<-EOS
  #get('name'): #{hashmap.get('name')}
  #get('age'): #{hashmap.get('age')}
  #get('job'): #{hashmap.get('job')}
  #get('mobile'): #{hashmap.get('mobile')}
  #has?('job'): #{hashmap.has?('job')}
  #has?('location): #{hashmap.has?('location')}
  #length: #{hashmap.length}
  #remove('mobile'): #{hashmap.remove('mobile')}
  #remove('location): #{hashmap.remove('location')}
  #length: #{hashmap.length}
  #keys: #{hashmap.keys}
  #values: #{hashmap.values}
  #entries: #{hashmap.entries}
  #clear: #{hashmap.clear}
  #length: #{hashmap.length}
EOS
