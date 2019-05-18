require 'pry'

string0 = 'aabcccccaaa'
# 'a2b1c5a3'

string1 = 'aabccaa'
# 'aabccaa'

# O(N)
def compress(string)
  compressed = ''
  current = [nil, 0]

  # O(N + N) = O(N)
  string.split('').each do |letter|
    if letter == current[0]
      current[1] += 1
    else
      compressed << current[0] << current[1].to_s if current[0]
      current = [letter, 1]
    end
  end

  compressed << current[0] << current[1].to_s

  return string if string.length <= compressed.length
  compressed
end

puts compress(string0)
puts compress(string1)
