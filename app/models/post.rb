class Post < ApplicationRecord
  belongs_to :use
  has_many :comments
  
  validates :description, presence: true

end
