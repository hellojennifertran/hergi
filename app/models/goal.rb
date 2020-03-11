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
      category_type: ["<i class='fas fa-dumbbell'></i> Gym", "<i class='fas fa-carrot'></i> Ate healthy", "<i class='fas fa-running'></i> Cardio", "<i class='fas fa-heartbeat'></i> Other"]
    },
    {
      category: 'Exploration',
      icon: '<i class="fas fa-binoculars"></i>',
      category_type: ["<i class='fas fa-utensils'></i> Dining", "<i class='fas fa-music'></i> Social", "<i class='fas fa-mountain'></i> Nature", "<i class='fas fa-user-graduate'></i> Skill"]
    },
    {
      category: 'Relationship',
      icon: '<i class="fas fa-users"></i>',
      category_type: ["<i class='fas fa-user-friends'></i> Friends", "<i class='fas fa-users'></i> Family", "<i class='far fa-heart'></i> Dating", "<i class='fas fa-glass-cheers'></i> Social"]
    }
  ]
end
