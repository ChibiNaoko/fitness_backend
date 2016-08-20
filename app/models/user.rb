class User < ActiveRecord::Base
  belongs_to :manager
  has_many :negotiates
  has_many :user_meetings
  has_many :meetings, through: :user_meetings

  enum role: {trainer: 0, customer: 1}

  validates :full_name, :birthday, :tel_number, :address, :role, presence: true
  validates :meeting_money, presence: true, if: :trainer?
  validates :registry_date, :expiry_date, presence: true, if: :customer?
end
