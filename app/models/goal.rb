class Goal < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  CATEGORIES = [
    {
      category: 'Health',
      category_type: %w[sport healthyfood running]
    },
    {
      category: 'Exploration',
      category_type: %w[dancing climbing swimming]
    },
    {
      category: 'Relationships',
      category_type: %w[friends family dating social]
    }
  ]
end
