require "rspec"
require_relative "../lib/deck"
require_relative "../lib/card"

describe "Deck" do
  let(:deck) { Deck.new }
  let(:card_ranks) { %w(A K Q J 10 9 8 7 6 5 4 3 2) }
  let(:card_suits) { %w(S C H D) }

  context "whole deck" do
    it "has 52 cards" do
      expect(deck.deck.length == 52).to be true
    end

    it "should not have any duplicate cards" do
      expect(deck.deck.uniq.length == deck.deck.length).to be true
    end

    it "has 13 cards for each suit" do
      card_suits.each do |suit|
        matched_cards = deck.deck.select { |card| card["#{suit}"] == suit }
        expect(matched_cards.length).to eq 13
      end
    end

    it "has 4 cards for each rank" do
      card_ranks.each do |rank|
        matched_cards = deck.deck.select { |card| card["#{rank}"] == rank }
        expect(matched_cards.length).to eq 4
      end
    end
  end
end