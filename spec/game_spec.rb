require "rspec"
require_relative "../lib/game"

describe "Game" do
  let(:deck) { Deck.new }
  let(:game) { Game.new( Hand.new(deck), Hand.new(deck) ) }

  context "new game" do
    it "has two players" do
      expect(game.player_one.cards.length).to eq 5
      expect(game.player_two.cards.length).to eq 5
    end
  end

  describe "different hands" do
    context "royal flush" do
      let(:royal_flush_spades) { ["QS", "10S", "JS", "KS", "AS"] }
      let(:royal_flush_hearts) { ["QH", "10H", "JH", "KH", "AH"] }
      let(:royal_flush_clubs) { ["QC", "10C", "JC", "KC", "AC"] }
      let(:royal_flush_diamonds) { ["QD", "10D", "JD", "KD", "AD"] }
      let(:not_royal_flush) { ["10S", "9D", "JC", "6H", "AS"] }

      it "has all cards of the same suit" do
        expect(game.is_flush?(royal_flush_spades)).to be true
        expect(game.is_flush?(royal_flush_hearts)).to be true
        expect(game.is_flush?(royal_flush_clubs)).to be true
        expect(game.is_flush?(royal_flush_diamonds)).to be true
        expect(game.is_flush?(not_royal_flush)).to be false
      end

      it "has all cards sequentially in order" do
        expect(game.is_straight?(royal_flush_spades)).to be true
        expect(game.is_straight?(royal_flush_hearts)).to be true
        expect(game.is_straight?(royal_flush_clubs)).to be true
        expect(game.is_straight?(royal_flush_diamonds)).to be true
        expect(game.is_straight?(not_royal_flush)).to be false
      end

      it "has all cards of the same suit in order and highest rank" do
        expect(game.is_royal_flush?(royal_flush_spades)).to be true
        expect(game.is_royal_flush?(royal_flush_hearts)).to be true
        expect(game.is_royal_flush?(royal_flush_clubs)).to be true
        expect(game.is_royal_flush?(royal_flush_diamonds)).to be true
        expect(game.is_royal_flush?(not_royal_flush)).to be false
      end
    end
  end
end