class Like < ApplicationRecord
  belongs_to :tag
  belongs_to :contact
  validates :tag, presence: true
end
