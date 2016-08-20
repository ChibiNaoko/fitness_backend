class Negotiate < ActiveRecord::Base
  has_many :negotiate_items
  has_many :items, through: :negotiate_items
  belongs_to :manager
  belongs_to :user
end
