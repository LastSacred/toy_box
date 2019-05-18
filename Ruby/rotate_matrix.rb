require 'pry'

matrix = [
  ['0001', '0010', '0011', '0100'],
  ['0101', '0110', '0111', '1000'],
  ['1001', '1010', '1011', '1100'],
  ['1101', '1110', '1111', '0000']
]

def rotate(matrix)
  size = matrix.length

  layer = 0
  while layer < size / 2
    last = size - 1 - layer

    x = layer
    while x < last
      offset = x - layer

      temp = matrix[layer][x]
      matrix[layer][x] = matrix[last - offset][layer]
      matrix[last - offset][layer] = matrix[last][last - offset]
      matrix[last][last - offset] = matrix[x][last]
      matrix[x][last] = temp

      x += 1
    end

    layer += 1
  end
  binding.pry
  matrix
end

puts rotate(matrix)
