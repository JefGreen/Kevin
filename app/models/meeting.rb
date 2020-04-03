class Meeting < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :contacts, through: :events
  has_many :questions, through: :contacts

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def color(value)
    case value.to_i
    when 'NA'
      "red"
    when 0...10
      "red"
    when 10...40
      "orange"
    when 40...100
      "yellow"
    when 100
      "green"
    end
  end

end
