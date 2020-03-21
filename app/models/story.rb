class Story < ApplicationRecord
  belongs_to :user
  belongs_to :attachment
  has_many :memories, dependent: :destroy
  has_many :contacts, through: :memories
end
