# frozen_string_literal: true

class Axis < ApplicationRecord
  belongs_to :sub_category
  has_many :subjects, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
