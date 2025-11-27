class Message < ApplicationRecord
  belongs_to :chat

  validates :chat_id, presence: true, numericality: { only_integer: true }
  validates :role, presence: true, inclusion: { in: ["user", "assistant"] }
  validates :content, presence: true

  scope :by_user, -> { where(role: "user") }
  scope :by_assistant, -> { where(role: "assistant") }

end
