# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :axis
  has_many :sub_categories

  validates :name, presence: true, uniqueness: true
end
