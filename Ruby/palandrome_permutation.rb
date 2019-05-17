require 'pry'

string0 = 'Tact Coa'
# true

string1 = 'Bro What'
# false

# O(5N) = O(N)
def pal_perm?(string)
  # O(N + N) = O(N)
  string = string.downcase.split('')
  # O(N)
  string.delete(' ')
  solo_allowed = string.count.odd?

  # O(N + N) = O(N)
  string.group_by { |letter| letter }.each do |letter, instances|
    if instances.count.odd?
      return false if !solo_allowed
      solo_allowed = false
    end
  end

  return true
end

puts pal_perm?(string0)
puts pal_perm?(string1)
