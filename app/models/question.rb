class Question < ApplicationRecord
  belongs_to :contact
  has_many :answers, dependent: :destroy
end
