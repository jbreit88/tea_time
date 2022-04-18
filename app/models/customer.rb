class Customer < ApplicationRecord
  # Validations
  validates_presence_of :first_name
  validates_presence_of :last_name

  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  validates_presence_of :address

  # Relationships
  has_many :subscriptions
  has_many :teas, through: :subscriptions
end
