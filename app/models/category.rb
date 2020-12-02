# typed: strict
# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subjects, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
