require 'pry'

# O(2N) = O(N)
def fibonacci(i, memo = [])
  return i if i == 1 || i == 0

  memo[i] = fibonacci(i - 1, memo) + fibonacci(i - 2, memo) if !memo[i]

  return memo[i]
end

binding.pry
puts 'end'
