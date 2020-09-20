# frozen_string_literal: true

class Objective < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :subject, optional: true

  enumerize :status, in: %i[draft pending finished]
  enumerize :difficulty, in: %i[easy medium hard]
  enumerize :bloom_taxonomy, in: %i[remember understand apply analyze evaluate create]

  before_save :update_introduction

  private

  def update_introduction
    without_html_tags = body.gsub(%r{</?[^>]+?>}, ' ')
    without_breaklines = without_html_tags.gsub(/\s+/, ' ')

    self.introduction = if without_breaklines.size <= 14
                          without_breaklines
                        else
                          without_breaklines[0, 14]
                        end
  end
end
