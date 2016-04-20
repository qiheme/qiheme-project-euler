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
      let(:flush_spades) { ["QS", "10S", "JS", "KS", "AS"] }
      let(:flush_hearts) { ["QH", "10H", "JH", "KH", "AH"] }
      let(:flush_clubs) { ["QC", "10C", "JC", "KC", "AC"] }
      let(:flush_diamonds) { ["QD", "10D", "JD", "KD", "AD"] }
      let(:not_flush) { ["QS", "10D", "JC", "KH", "AS"] }

      it "has all cards of the same suit" do
        expect(game.is_flush?(flush_spades)).to be true
        expect(game.is_flush?(flush_hearts)).to be true
        expect(game.is_flush?(flush_clubs)).to be true
        expect(game.is_flush?(flush_diamonds)).to be true
        expect(game.is_flush?(not_flush)).to be false
      end
    end
  end
end