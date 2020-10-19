# frozen_string_literal: true

class Category < ApplicationRecord
  has_and_belongs_to_many :axes

  has_many :sub_categories
  has_many :subjects

  validates :name, presence: true, uniqueness: true
end
