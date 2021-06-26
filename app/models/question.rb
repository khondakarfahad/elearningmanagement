class Question < ApplicationRecord
  validates :name, :answer, :options, presence: true
  belongs_to :lesson
end
