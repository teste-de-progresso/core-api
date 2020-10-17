# frozen_string_literal: true

class Axis < ApplicationRecord
  has_and_belongs_to_many :categories, foreign_key: 'category_id'

  validates :name, presence: true, uniqueness: true
end
