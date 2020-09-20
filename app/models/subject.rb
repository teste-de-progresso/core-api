# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :axis
  has_many :objectives, dependent: :restrict_with_exception

  validates :name, presence: true, uniqueness: true
end
