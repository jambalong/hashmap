# HashMap

This project is part of The Odin Project: [HashMap](https://www.theodinproject.com/lessons/ruby-hashmap)

## Assignment Overview

In this project, you will implement a simple HashMap in Ruby. You will create a `HashMap` class and implement the following methods to handle key-value pairs efficiently.

### Methods to Implement

1. **`#hash(key)`**
   - Takes a key (string) and produces a hash code using a prime number.
   - Example implementation:
   ```ruby
   def hash(key)
     hash_code = 0
     prime_number = 31
     key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
     hash_code
   end
   ```

2. **`#set(key, value)`**
   - Takes a key and a value as arguments. If the key already exists, updates its value.

3. **`#get(key)`**
   - Returns the value associated with the given key. Returns `nil` if the key is not found.

4. **`#has?(key)`**
   - Returns `true` if the key is present in the hash map; otherwise, returns `false`.

5. **`#remove(key)`**
   - Removes the entry associated with the given key and returns its value. Returns `nil` if the key is not found.

6. **`#length`**
   - Returns the number of stored keys in the hash map.

7. **`#clear`**
   - Removes all entries in the hash map.

8. **`#keys`**
   - Returns an array containing all keys in the hash map.

9. **`#values`**
   - Returns an array containing all values in the hash map.

10. **`#entries`**
    - Returns an array of key-value pairs in the format `[[key1, value1], [key2, value2], ...]`.

## Important Notes

- The hash map does not preserve the insertion order of keys.
- Only string keys are supported for this project.
- Handle collisions by implementing a mechanism to resolve them.

## Limitation

Use the following snippet whenever you access a bucket through an index. We want to raise an error if we try to access an out of bound index:
```
raise IndexError if index.negative? || index >= @buckets.length
```

## Installation

### Prerequisites

Before you begin, ensure you have met the following requirements:
- You have Ruby installed on your machine. You can check your Ruby version with:

  ```bash
  ruby -v
  ```

### Setup

To set up the HashMap project locally, follow these steps:

1. **Clone the Repository:**

   Open your terminal and run the following command to clone the repository:

   ```bash
   git clone https://github.com/jambalong/hashmap.git
   ```

2. **Navigate to the Project Directory**:
   ```bash
   cd hashmap
   ```

3. **Run the Tests**:
   ```bash
   ruby main.rb
   ```

4. **Explore the Code**: Open the project files in your preferred code editor to review or modify the code as needed.
