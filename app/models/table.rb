class Table < ActiveRecord::Base
  has_many :players
  has_one :dealer
  has_many :cards

  def blinds_please
  	@table = Table.find(self.id)
  	if (@table.button+1).between?(1, 9)
  		small_blind = @table.players.find_by_seat(self.button + 1)
  	elsif @table.button+1 == 10
  		small_blind = @table.players.find_by_seat(1)
  	end

  	if (@table.button+2).between?(1, 9)
  		big_blind = @table.players.find_by_seat(self.button + 2)
  	elsif @table.button+2 == 10
  		big_blind = @table.players.find_by_seat(1)
  	elsif @table.button+2 == 11
  		big_blind = @table.players.find_by_seat(2)
  	end

  	small_blind.bet(self.sb)
  	big_blind.bet(self.bb)
  end
end
