# frozen_string_literal: true

class Objective < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :subject, optional: true

  enumerize :status, in: %i[draft pending finished]
  enumerize :difficulty, in: %i[easy medium hard]
  enumerize :bloom_taxonomy, in: %i[remember understand apply analyze evaluate create]
  enumerize :check_type, in: %i[
    unique_answer
    incomplete_affirmation
    multiple_answer
    negative_focus
    assertion_and_reason
    gap
    interpretation
    association
    ordering_or_ranking
    constant_alternatives
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
