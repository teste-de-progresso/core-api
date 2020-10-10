# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :axis
  has_many :sub_categories, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
