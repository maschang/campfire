class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users

  before_save :set_room_number

  validates :room_number, uniqueness: true

  def set_room_number
    self.room_number = SecureRandom.uuid
  end
end
