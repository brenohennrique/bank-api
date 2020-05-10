class Account < ApplicationRecord
  # encrypt password
  has_secure_password

  validates_presence_of :name, :password_digest
  validates_length_of :name, maximum: 50
  validates :balance_amount, numericality: { greater_than_or_equal_to: 0 }
  validates :name, uniqueness: true
end
