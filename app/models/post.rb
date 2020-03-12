class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true
end
