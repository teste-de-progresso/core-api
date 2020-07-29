# frozen_string_literal: true

class Objective < ApplicationRecord
  belongs_to :user, optional: true

  extend Enumerize

  enumerize :correct_answer, in: %i[a b c d e]
  enumerize :status, in: %i[draft pending finished]

  validates :title, :body, presence: true
end
