class Dealer < ActiveRecord::Base
  belongs_to :table
  has_one :deck

  def give_card
  	cards = self.deck.cards.find_all_by_played(false)
  	card = cards.sample
  	card.played = true
  	card
  end

  def showdown
  	@table = Table.find(self.table_id)
  	hands = {}
  	@table.players.each do |player|
  		if player.cards.count > 0 
  			hand = player.cards + @table.cards
  			hands.store("#{player.seat}", "#{Evaluator.make_best(hand)}")
  			player.hand = Evaluator.make_best(hand)
  			player.save
  		end
  	end
  end
end
