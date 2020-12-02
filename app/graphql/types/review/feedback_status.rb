# typed: strict
# frozen_string_literal: true

module Types
  module Review
    class FeedbackStatus < Types::BaseEnum
      value 'comment'
      value 'approve'
      value 'request_change'
    end
  end
end
