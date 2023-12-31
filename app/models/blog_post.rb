class BlogPost < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
end
