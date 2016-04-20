require_relative "../lib/hand"

class Game
  attr_accessor :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def is_flush?(hand)
    flush = false
    while !flush
      %w(S C H D).each do |suit|
        i = 0
        hand.each {|card| i += 1 if card["#{suit}"] == suit  }
        flush = true if i == 5
      end
      return flush
    end
  end
end