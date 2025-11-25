class Chat < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  has_many :messages, dependent: :destroy
 
  validates :user_id, presence: true
  validates :problem_id, presence: true
end
