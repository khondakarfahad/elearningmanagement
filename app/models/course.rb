class Course < ApplicationRecord
  validates :name, presence: true
  has_many :lessons, dependent: :destroy
end
