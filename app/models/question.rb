# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id              :bigint           not null, primary key
#  alternatives    :jsonb            not null
#  authorship_year :string
#  bloom_taxonomy  :string
#  body            :text
#  check_type      :string
#  difficulty      :string
#  explanation     :text
#  instruction     :text
#  introduction    :string
#  references      :text
#  source          :string
#  status          :string           default("draft"), not null
#  support         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  subject_id      :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_questions_on_subject_id  (subject_id)
#  index_questions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#
class Question < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :subject, optional: true
  has_many :review_requests, dependent: :destroy
  has_many :review_feedbacks, through: :review_requests

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

  before_create do
    self.uuid = SecureRandom.uuid
  end

  def reviewer
    review_requests.last&.user
  end

  private

  def update_introduction
    return if body.nil?

    without_html_tags = body.gsub(%r{</?[^>]+?>}, " ").gsub(/\s+/, " ")

    self.introduction = if without_html_tags.size <= 20
      without_html_tags
    else
      without_html_tags[0, 20]
    end
  end
end
