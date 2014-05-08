class Dealer < ActiveRecord::Base
  belongs_to :table
  has_one :deck

end
