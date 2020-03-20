class Contact < ApplicationRecord
  has_one_attached :photo
  has_many :likes, dependent: :destroy
  has_many :group_contacts, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :memories
end
