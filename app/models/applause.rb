class Applause < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :idea, required: true
end
