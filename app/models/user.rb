class User < ApplicationRecord
  has_many :problems
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :problems, dependent: :destroy
has_many :chats, dependent: :destroy

end
