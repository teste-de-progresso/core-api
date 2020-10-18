# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :save_question, mutation: Mutations::Question::Save
    field :save_question_draft, mutation: Mutations::Question::SaveDraft
    field :send_feedback, mutation: Mutations::Review::SendFeedback
  end
end
