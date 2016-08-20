class NegotiateItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :negotiate
end
