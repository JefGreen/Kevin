class Story < ApplicationRecord
  belongs_to :user
  has_many_attached :attachments
  has_many :memories, dependent: :destroy
  has_many :contacts, through: :memories
end
