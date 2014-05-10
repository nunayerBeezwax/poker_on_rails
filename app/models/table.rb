class Table < ActiveRecord::Base
  has_many :players
  has_one :dealer
  has_many :cards

  def blinds_please
  	@table = Table.find(self.id)
    small_blind = @table.players.find_by_seat((self.button+1).to_s.split(//).map(&:to_i).inject(:+))
    big_blind = @table.players.find_by_seat((self.button+2).to_s.split(//).map(&:to_i).inject(:+))

  	small_blind.bet(self.sb)
  	big_blind.bet(self.bb)
  end
end
