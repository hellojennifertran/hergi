class Goal < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :category_type, presence: true
  validates :date, presence: true
  validates :note, presence: true

  CATEGORIES = [
    {
      category: 'Health',
      icon: '<i class="fas fa-heartbeat"></i>',
      category_type: %w[sport healthyfood running]
    },
    {
      category: 'Exploration',
      icon: '<i class="fas fa-binoculars"></i>',
      category_type: %w[dancing climbing swimming]
    },
    {
      category: 'Relationship',
      icon: '<i class="fas fa-users"></i>',
      category_type: %w[friends family dating social]
    }
  ]
end
