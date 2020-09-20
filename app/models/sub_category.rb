# frozen_string_literal: true

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :axes, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
