class Event < ApplicationRecord
  belongs_to :meeting
  belongs_to :contact
end
