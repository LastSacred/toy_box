require 'pry'

matrix = [
  [1,1,1,1,1],
  [1,1,0,1,1],
  [1,1,1,1,1],
  [1,1,1,1,0]
]

# O(2ab) = O(ab)
def zero(matrix)
  zero_ys = {}
  zero_xs = {}

  # O(ab)
  matrix.each_with_index do |row, y|
    row.each_with_index do |num, x|
      if num == 0
        zero_ys[y] = true
        zero_xs[x] = true
      end
    end
  end

  # O(ab)
  matrix.each_with_index.map do |row, y|
    row.each_with_index.map do |num, x|
      zero_ys[y] || zero_xs[x] ? 0 : num
    end
  end
end

binding.pry
zero(matrix)
