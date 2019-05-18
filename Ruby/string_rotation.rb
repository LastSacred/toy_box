require 'pry'

s1 = 'waterbottle'
s2 = 'erbottlewat'
#  true

# O(N)
def is_rotation_a(s1, s2)
  s1 = s1.split('')
  s2 = s2.split('')

  (s1.length).times do
    s1 << s1.shift
    return true if s1 == s2
  end

  false
end

# O(N)
def is_rotation_b(s1, s2)
  (s1 * 2).include?(s2)
end

puts is_rotation_b(s1, s2)
