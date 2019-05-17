require 'pry'

string0 = 'string'
# true

string1 = 'hello'
# false

# O(N + N) = O(N)
def unique_a?(string)
  # O(N)
  string = string.split('')

  # O(N)
  string == string.uniq
end

# without #uniq
# O(N + N) = O(N)
def unique_b?(string)
  # O(N)
  string = string.split('')
  characters = {}

  # O(N)
  string.each do |character|
    return false if characters[character]
    characters[character] = true
  end

  return true
end

# without #split
# O(N)
def unique_c?(string)
  count = 0
  characters = {}

  # O(N)
  while count < string.length
    character = string[count]

    return false if characters[character]

    characters[character] = true
    count += 1
  end

  return true
end

# without a hash
# O(N)
def unique_d?(string)

  # assums all characters are letters
  alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
  count = 0

  # O(N)
  while count < string.length
    character = string[count]

    # O(1) because alphabet is a constant size
    return false if !alphabet.include?(character)

    # O(1) because alphabet is a constant size
    alphabet.delete(character)

    count += 1
  end

  return true
end

puts unique_d?(string0)
puts unique_d?(string1)
