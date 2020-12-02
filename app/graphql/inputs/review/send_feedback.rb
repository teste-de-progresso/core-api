# typed: strict
# frozen_string_literal: true

module Inputs
  module Review
    class SendFeedback < Types::BaseInputObject
      argument :question_id, ID, required: true
      argument :status, Types::Review::FeedbackStatus, required: false
      argument :comment, String, required: false
    end
  end
end
