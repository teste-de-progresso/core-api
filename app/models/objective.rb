# frozen_string_literal: true

class Objective < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :subject, optional: true

  enumerize :status, in: %i[draft pending finished]
  enumerize :difficulty, in: %i[easy medium hard]
  enumerize :bloom_taxonomy, in: %i[remember understand apply analyze evaluate create]
  enumerize :check_type, in: %i[
    incomplete_affirmation
    assertion_reason
    column_association
    gap_or_replacement_of_terms
    multiple_choice_complex
    sultiple_multiple_choice
    serialization
    true_or_false
  ]

  before_save :update_introduction

  private

  def update_introduction
    return if body.nil?

    without_html_tags = body.gsub(%r{</?[^>]+?>}, ' ').gsub(/\s+/, ' ')

    self.introduction = if without_html_tags.size <= 20
                          without_html_tags
                        else
                          without_html_tags[0, 20]
                        end
  end
end
