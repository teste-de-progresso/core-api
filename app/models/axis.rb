# frozen_string_literal: true

class Axis < ApplicationRecord
  has_many :subjects, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
