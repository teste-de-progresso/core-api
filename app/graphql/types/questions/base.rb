# frozen_string_literal: true

module Types
  module Questions
    class Base < Types::BaseObject
      graphql_name 'Question'

      field :id, ID, null: false
      field :uuid, ID, null: false
      field :introduction, String, null: true
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

      field :alternatives, [Alternative], null: false
      field :reviewer, Types::Core::UserType, null: true
      field :review_requests, [Types::Review::Request], null: false
      field :review_feedbacks, [Types::Review::Feedback], null: false

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
end
