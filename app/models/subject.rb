# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :axis
  belongs_to :category

  has_many :objectives, dependent: :restrict_with_exception # Depreciated due to questions
  has_many :questions, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
