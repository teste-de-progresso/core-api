# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :category
  belongs_to :sub_category

  validates :name, presence: true, uniqueness: true
end
