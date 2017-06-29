class ChatRoom < ApplicationRecord
	before_save { title.downcase! }
  belongs_to :user
  has_many :messages, dependent: :destroy
	has_many :users, through: :messages
  validates :title, length: { minimum: 2, maximum: 50 } , presence: true, uniqueness: true, case_sensitive: false
  validates :description, presence: true, length: { minimum: 2, maximum: 255 }
end
