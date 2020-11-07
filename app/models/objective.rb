# frozen_string_literal: true

class Objective < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :subject, optional: true
  has_many :review_requests, dependent: :destroy

  enumerize :status, in: %i[draft pending approved finished]
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

  def reviewer
    review_requests.last&.user
  end

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
