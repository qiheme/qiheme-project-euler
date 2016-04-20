require "rspec"
require_relative "../lib/card"

describe "Card" do
  let(:card) { Card.new }
  let(:card_ranks) { %w(A K Q J 10 9 8 7 6 5 4 3 2) }
  let(:card_suits) { %w(S C H D) }

  context "single card" do
    it "has a rank ranging from 2 to A" do
      expect(card_ranks.include? card.rank).to be true
    end

    it "has a suit of S C H D" do
      expect(card_suits.include? card.suit).to be true
    end

    it "has a value with a combined rank and suit" do
      card_split = card.value.split('')
      if card_split.length == 3
        card_split[0] += card_split[1]
        card_split.delete_at(1)
      end
      expect(card_ranks.include? card_split[0]).to be true
      expect(card_suits.include? card_split[1]).to be true
    end
  end
end