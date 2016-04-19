require_relative "../lib/deck"

class Hand
  attr_accessor :cards

  def initialize(deck)
    @cards = deal_cards(deck)
  end

  def deal_cards(deck)
    hand = []
    5.times do 
      card = deck.deck.sample
      hand.push(card)
      deck.deck.delete(card)
    end
    return hand
  end
end