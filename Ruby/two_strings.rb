require 'pry'

s1 = 'hello'
s2 = 'world'
# 'YES'

def twoStrings(s1, s2)
  s1 = s1.split('')
  s2 = s2.split('')
  h1 = {}

  s1.each do |letter|
    h1[letter] = true
  end

  s2.each do |letter|
    return 'YES' if h1[letter]
  end

  return 'NO'
end
