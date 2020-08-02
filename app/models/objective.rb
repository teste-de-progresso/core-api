# frozen_string_literal: true

class Objective < ApplicationRecord
  belongs_to :user, optional: true

  extend Enumerize

  enumerize :correct_answer, in: %i[a b c d e]
  enumerize :status, in: %i[draft pending finished]

  # TODO: alternatives should be mandatory
  validates :body, :status, presence: true

  before_save :update_introduction

  private

  def update_introduction
    without_html_tags = body.gsub(%r{</?[^>]+?>}, '')
    without_breaklines = without_html_tags.gsub(/\s+/, '')

    self.introduction = if without_breaklines.size <= 14
                          without_breaklines
                        else
                          without_breaklines[0, 14]
                        end
  end
end
