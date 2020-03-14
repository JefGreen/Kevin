class Contact < ApplicationRecord
  has_one_attached :photo
  has_many :likes, dependent: :destroy
end
