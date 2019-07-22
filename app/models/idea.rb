class Idea < ApplicationRecord
  before_save :tag_delete_space
  belongs_to :user, required: true
  has_many :applauses, dependent: :destroy
  has_many :idea_reactions, dependent: :destroy

  
  validates :title, presence: true, length: {minimum: 5, maximum: 80}
  validates :body,  presence: true, length: {maximum: 2000}
  validates :state, format: { with: /(実現済み|対応中|既にある|未実現)/  }

  def tag_delete_space
    text = read_attribute(:tag)
    tag = text.gsub(/^,+|[[:blank:]]|\"|\'|,+$/, "").split(',').reject{|v| v.empty?}.uniq.join(',')
    write_attribute(:tag, tag)
  end
end
