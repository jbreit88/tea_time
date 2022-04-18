# frozen_string_literal: true

class Subscription < ApplicationRecord
  # Validations
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status

  # Relationships
  belongs_to :customer
  belongs_to :tea

  # Enums
  enum status: { active: 0, cancelled: 1 }
  enum frequency: { weekly: 0, monthly: 1, bi_monthly: 2 } # Can add more to frequency later if need be.
end
