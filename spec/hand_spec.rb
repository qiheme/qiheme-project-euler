require "rspec"
require_relative "../lib/hand"

describe "Hand" do
  let(:deck) { Deck.new }
  let(:hand) { Hand.new(deck) }

  context "one player's hand" do
    it "has 5 cards" do
      expect(hand.cards.length).to eq 5
    end

    it "should not have the same cards in the hand and deck" do
      hand.cards.each { |card| expect(deck.deck.include? card).to be false }
    end

    it "should make sure the deck has 47 cards after dealing" do
      player_one = hand
      expect(deck.deck.length).to eq 47 
    end
  end

  context "two players' hands" do
    let(:player_one) { Hand.new(deck) }
    let(:player_two) { Hand.new(deck) }

    it "should have 5 cards for both players" do
      expect(player_one.cards.length).to eq 5
      expect(player_two.cards.length).to eq 5
    end

    it "should not have the same cards in both hands and deck" do
      player_one.cards.each { |card| expect(deck.deck.include? card).to be false }
      player_two.cards.each { |card| expect(deck.deck.include? card).to be false }
    end

    it "should make sure the deck has 47 cards after dealing" do
      player_one
      player_two
      expect(deck.deck.length).to eq 42 
    end
  end
end