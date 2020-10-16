# frozen_string_literal: true

class Subject < ApplicationRecord
  has_one :axis
  has_many :objectives

  validates :name, presence: true, uniqueness: true
end
