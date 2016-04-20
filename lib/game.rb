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
    end

    return flush
  end

  def is_straight?(hand)
    straight = false
    ranks = %w(A K Q J 10 9 8 7 6 5 4 3 2)

    card_positions = hand.map do |card|
      card_split = card.split('')
      if card_split.length == 3
        card_split[0] += card_split[1]
        card_split.delete_at(1)
      end
      ranks.index(card_split.first)
    end

    card_positions = card_positions.sort
    i = card_positions.first

    card_positions.each do |index|
      while i == index
        i += 1
      end
    end

    straight = true if i - 1 == card_positions[-1]
    return straight
  end
end