class Table < ActiveRecord::Base
  has_many :players
  has_one :dealer

end
