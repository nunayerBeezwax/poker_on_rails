class Player < ActiveRecord::Base
  belongs_to :table
  has_many :cards

  def bet(amount)
  	@table = Table.find(self.table_id)
  	self.chips -= amount.to_i
    self.imin = amount.to_i
  	if @table.pot
  		@table.pot += amount.to_i
  	else
  		@table.pot = amount.to_i
  	end
  	self.save
    @table.bet = amount.to_i
  	@table.save
  end

  def fold
    self.cards = []
    self.save
  end

  def decision
    if Brain.preflop(self.cards, 50) == "Fold"
      self.fold
    elsif Brain.preflop(self.cards, 50) == "Call"
      self.bet(50)
    else
      self.bet(150)
    end
  end
  
end
