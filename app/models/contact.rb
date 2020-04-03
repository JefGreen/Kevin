class Contact < ApplicationRecord
  has_one_attached :photo
  has_many :likes, dependent: :destroy
  has_many :group_contacts, dependent: :destroy
  has_many :groups, through: :group_contacts
  has_many :questions, dependent: :destroy
  has_many :memories
  has_many :stories, through: :memories
  has_many :events
  has_many :meetings, through: :events

  def self.percentage
    Question.count.zero? ? 0 : Question.where(score: 100).count * 100 / Question.count
  end

  def percentage
    questions.count.zero? ? 0 : questions.where(score: 100).count * 100 / questions.count
  end

  def color
    case percentage.to_i
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

  include PgSearch::Model
  pg_search_scope :search_by_name_and_groups,
                  against: %i[first_name last_name],
                  associated_against: {
                    groups: :name
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
