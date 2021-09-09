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
    field :source, String, null: true
    field :intention, String, null: true

    field :alternatives, [Types::Questions::Alternative], null: false
    field :reviewer, Types::Core::UserType, null: true
    field :review_requests, [Types::ReviewRequest], null: false

    field :subject, Types::SubjectType, null: true

    def subject
      dataloader.with(Sources::ActiveRecord, Subject).load(object.subject_id)
    end

    field :user, Core::UserType, null: false

    def user
      dataloader.with(Sources::ActiveRecord, User).load(object.user_id)
    end

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
