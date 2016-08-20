class Manager < ApplicationRecord

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :users
  has_many :meetings
  has_many :items
  has_many :negotiates

  validates :user_name, :full_name, :tel_number, :address,  presence: true

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
