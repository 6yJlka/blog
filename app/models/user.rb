class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :blog_posts, dependent: :destroy
  attribute :avatar, :binary
  has_one_attached :avatar

  has_and_belongs_to_many :friends,
                          class_name: 'User',
                          join_table: :friends,
                          foreign_key: :user_id,
                          association_foreign_key: :friend_id
  def username
       # Верните значение атрибута username
       self[:username]
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
