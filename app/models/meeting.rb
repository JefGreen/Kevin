class Meeting < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :contacts, through: :events
end
