# frozen_string_literal: true

class Objective < ApplicationRecord
  extend Enumerize

  enumerize :correct_answer, in: %i[a b c d e]
  enumerize :status, in: %i[draft pending finished]

  validates :title, :body, :alternatives, presence: true
end
