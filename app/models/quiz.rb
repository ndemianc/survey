class Quiz < ApplicationRecord
  has_many :questions
  has_many :answers

  scope :finished, -> { where(is_active: false) }
end
