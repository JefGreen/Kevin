class Story < ApplicationRecord
  belongs_to :author
  belongs_to :attachment
end
