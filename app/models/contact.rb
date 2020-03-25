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
