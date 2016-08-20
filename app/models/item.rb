class Item < ActiveRecord::Base
  has_many :negotiate_items
  has_many :negotiates, through: :negotiate_items
  belongs_to :manager
end
