require_relative "../lib/card"

class Deck
  attr_accessor :deck

  def initialize
    @deck = assemble_deck
  end

  def assemble_deck
    deck = []
    52.times do
      card = Card.new
      deck.push(check_duplicate(deck, card))
    end
    return deck
  end

  def check_duplicate(deck, card)
    if deck.include? card.value
      card = Card.new
      check_duplicate(deck, card)
    else
      card.value
    end
  end
end