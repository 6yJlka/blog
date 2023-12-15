class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :blog_posts, dependent: :destroy
  attribute :avatar, :binary
  has_one_attached :avatar
  def username
       # Верните значение атрибута username
       self[:username]
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
