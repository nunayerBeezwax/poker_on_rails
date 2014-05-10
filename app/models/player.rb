class Player < ActiveRecord::Base
  belongs_to :table
  has_many :cards

  def bet(amount)
  	@table = Table.find(self.table_id)
  	self.chips -= amount
  	if @table.pot
  		@table.pot += amount
  	else
  		@table.pot = amount
  	end
  	self.save
  	@table.save
  end

  def fold
    self.cards = []
  end
end
