class Message < ApplicationRecord
  belongs_to :chat

  validates :chat_id, presence: true, numericality: { only_integer: true }
  validates :role, presence: true, inclusion: { in: ["user", "assistant"] }
  validates :content, presence: true

  scope :by_user, -> { where(role: "user") }
  scope :by_assistant, -> { where(role: "assistant") }


  MAX_USER_MESSAGES = 20

  validate :user_message_limit, if: -> { role == "user" }


  def assistant?
    role == "assistant"
  end

  def user?
    role == "user"
  end

  private

  def user_message_limit
    if chat.messages.where(role: "user").count >= MAX_USER_MESSAGES
      errors.add(:content, "You can only send #{MAX_USER_MESSAGES} messages per chat.")
    end
  end
end
