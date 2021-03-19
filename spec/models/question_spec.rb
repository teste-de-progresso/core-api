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
#  uuid            :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  subject_id      :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_questions_on_subject_id  (subject_id)
#  index_questions_on_user_id     (user_id)
#  index_questions_on_uuid        (uuid)
#
# Foreign Keys
#
#  fk_rails_...  (subject_id => subjects.id)
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:subject).optional(true) }
    it { is_expected.to have_many(:review_requests) }
    it { is_expected.to have_many(:review_feedbacks) }
  end
end
