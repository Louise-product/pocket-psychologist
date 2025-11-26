class Chat < ApplicationRecord
  belongs_to :problem
  belongs_to :user
  has_many :messages, dependent: :destroy


  DEFAULT_TITLE = "Untitled"
  TITLE_PROMPT = "Generate a short, descriptive, 3-to-6-word title that summarizes the user question for a chat conversation."


end
