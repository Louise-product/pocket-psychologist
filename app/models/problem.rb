class Problem < ApplicationRecord
  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :title, presence: true, length: { minimum: 3 }
  validates :content, presence: true
  belongs_to :user
end
