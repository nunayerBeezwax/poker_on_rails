class Table < ActiveRecord::Base
  has_many :players
  has_one :dealer
  has_many :cards

end
