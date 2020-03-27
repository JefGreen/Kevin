class Meeting < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :contacts, through: :events

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
