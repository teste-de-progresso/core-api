# frozen_string_literal: true

# == Schema Information
#
# Table name: review_messages
#
#  id            :bigint           not null, primary key
#  feedback_type :string           not null
#  text          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  question_id   :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_review_messages_on_question_id  (question_id)
#  index_review_messages_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#
class ReviewMessage < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :question

  enumerize :feedback_type, in: %i[request_changes approve answer]

  validates :text, presence: true
end
