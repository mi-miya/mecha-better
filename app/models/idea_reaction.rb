class IdeaReaction < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :idea, required: true
  validates :comment, presence: true, length: {maximum: 2000}
end
