class Idea < ApplicationRecord
  has_many :idea_reactions
  has_many :applauses
  belongs_to :user, required: true
  validates :title, presence: true, length: {maximum: 50}
  validates :body,  presence: true, length: {minimum: 10, maximum: 2000}
  validates :state, format: { with: /(実現済み|対応中|既にある|未実現)/  }
end
