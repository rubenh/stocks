class Position < ActiveRecord::Base

  validates_presence_of :symbol,
                        :quantity,
                        :price,
                        :commission
end
