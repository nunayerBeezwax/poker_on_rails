class Dealer < ActiveRecord::Base
  belongs_to :table
  has_one :deck

  def give_card
    self.deck.cards.order("RANDOM()").first
  end
end
