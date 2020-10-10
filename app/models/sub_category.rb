# frozen_string_literal: true

class SubCategory < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: true
end
