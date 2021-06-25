class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :password, confirmation: true
  validate :valid_phone_number

  enum role: { admin: 1, others: 2 }

  def valid_phone_number
    return unless phone_number.present?

    errors.add(:phone_number, :invalid) unless Phony.plausible?(phone_number)
  end
end
