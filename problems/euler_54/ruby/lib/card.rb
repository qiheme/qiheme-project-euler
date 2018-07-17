class Card
  attr_accessor :suit, :rank

  def initialize
    @suit = self.suits.sample
    @rank = self.ranks.sample
  end

  def value
    @rank + @suit
  end

  def suits
    %w(S C H D)
  end

  def ranks
    %w(A K Q J 10 9 8 7 6 5 4 3 2)
  end
end