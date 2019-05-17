require 'pry'

class Deck

  def initialize
    @state = (1..52).to_a << 'a' << 'b'

    show
  end

  def show
    puts @state.join(' ')
  end

  def move_a
    move('a')

    show
  end

  def move_b
    2.times { move('b') }

    show
  end

  def tripple_cut
    part1 = @state[0...indices[0]]
    part2 = @state[indices[0]..indices[1]]
    part3 = @state[indices[1] + 1 ..]

    @state = part3 + part2 + part1

    show
  end

  def count_cut
    return show if @state.last.class.name != 'Integer'

    count = @state.last
    part1 = @state.shift(count)
    part2 = @state.pop

    @state = (@state << part1 << part2).flatten

    show
  end

  private

  def move(joker)
    if (start_index = @state.find_index(joker)) == 53
      index = 1
    else
      index = start_index + 1
    end

    @state.insert(index, @state.delete(joker))
  end

  def indices
    [@state.find_index('a'), @state.find_index('b')].sort
  end

end

deck = Deck.new
deck.move_a
deck.move_a
deck.move_b
deck.move_b
deck.tripple_cut
deck.count_cut
