require 'pry'

first0 = 'pale'
second0 = 'ple'
# true

first1 = 'pales'
second1 = 'pale'
# true

first2 = 'pale'
second2 = 'bale'
# true

first3 = 'pale'
second3 = 'bake'
# false

# O(3N) = O(N)
def one_away?(first, second)
  # O(1)
  strings = [first, second].sort_by { |string| string.length}
  # O(2N) = O(N)
  strings = strings.map { |string| string.split('') }
  action_taken = false
  dif = strings[1].count - strings[0].count

  return false if  dif < 0 || dif > 1

  # O(N)
  strings[1].each_with_index do |base, index|
    index = index - 1 if action_taken && dif == 1

    if base != strings[0][index]
      return false if action_taken
      action_taken = true
    end
  end

  true
end

puts one_away?(first0, second0)
puts one_away?(first1, second1)
puts one_away?(first2, second2)
puts one_away?(first3, second3)
