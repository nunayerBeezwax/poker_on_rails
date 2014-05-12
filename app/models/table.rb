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

  def round_of_betting
    @table = Table.find(self.id)
    first_to_act = Player.find(@table.action_on_seat)
    first_to_act.decision

  end
end
