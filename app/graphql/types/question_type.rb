# frozen_string_literal: true

module Types
  class QuestionType < Types::BaseObject
    implements GraphQL::Types::Relay::Node
    graphql_name "Question"

    global_id_field :id
    field :instruction, String, null: true
    field :body, String, null: true
    field :support, String, null: true
    field :explanation, String, null: true
    field :references, String, null: true
    field :status, Types::Questions::Status, null: true
    field :check_type, Types::Questions::CheckType, null: true
    field :difficulty, Types::Questions::Difficulty, null: true
    field :bloom_taxonomy, Types::Questions::BloomTaxonomy, null: true
    field :authorship_year, String, null: true
    field :authorship, String, null: true
    field :intention, String, null: true
    field :alternatives, [Types::Questions::Alternative], null: false
    field :reviewer, Types::UserType, null: true
    field :review_requests, [Types::ReviewRequest], null: false
    field :review_messages, Types::ReviewMessageType.connection_type, null: false
    field :subject, Types::SubjectType, null: true
    field :user, UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def subject
      dataloader.with(Sources::ActiveRecord, Subject).load(object.subject_id)
    end

    def user
      dataloader.with(Sources::ActiveRecord, User).load(object.user_id)
    end
  end
end
