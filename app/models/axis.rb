# frozen_string_literal: true

class Axis < ApplicationRecord
  belongs_to :subject
  has_many :categories

  validates :name, presence: true, uniqueness: true
end
