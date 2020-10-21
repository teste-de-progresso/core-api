# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :axis
  belongs_to :category
  belongs_to :sub_category

  has_one :objectives, dependent: :restrict_with_exception
  validates :name, presence: true, uniqueness: true
end
