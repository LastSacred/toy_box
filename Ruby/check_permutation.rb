require 'pry'

first0 = 'cat'
second0 = 'act'
# true

first1 = 'park'
second1 = 'kart'
# false

# O(2(N + N log N)) = O(N log N)
def perm_a?(first, second)
  first.split('').sort == second.split('').sort
end

puts perm_a?(first0, second0)
puts perm_a?(first1, second1)
