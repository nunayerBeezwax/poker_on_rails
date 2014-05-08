class Game < ActiveRecord::Base
  attr_reader :table, :dealer, :hand
  has_one :table

  def initialize
    @table = Table.new
  end

end
