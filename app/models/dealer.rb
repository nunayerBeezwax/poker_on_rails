class Dealer < ActiveRecord::Base
  belongs_to :table
  has_one :deck

  def give_card
  	cards = self.deck.cards.find_all_by_played(false)
  	card = cards.sample
  	card.played = true
  	card
  end
end
