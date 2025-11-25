class User < ApplicationRecord
  has_many :problems, dependent: :destroy
  has_many :chats, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :gender, presence: true, inclusion: { in: %w[male, female, non-binary, other] }
  # validates :age, presence: true, numericality: { only_integer: true }
end

