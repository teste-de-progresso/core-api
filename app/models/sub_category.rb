# frozen_string_literal: true

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :subjects

  validates :name, presence: true, uniqueness: true
end
