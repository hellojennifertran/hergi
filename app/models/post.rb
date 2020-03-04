class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :comments

  validates :content, presence: true
end
