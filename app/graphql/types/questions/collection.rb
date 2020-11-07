# frozen_string_literal: true

module Types
  module Questions
    class CollectionPage < Types::BaseObject
      graphql_name 'QuestionCollectionPageType'

      field :nodes, [Types::Questions::Objective], null: true
      field :page_info, Types::PageInfo, null: true
    end

    class Collection < Types::BaseObject
      graphql_name 'QuestionCollectionType'

      field :payload, CollectionPage, null: false do
        argument :page, Integer, required: true
        argument :limit, Integer, required: true
      end

      def payload(page:, limit:)
        questions = object.page(page).per(limit)

        {
          nodes: questions,
          page_info: questions
        }
      end
    end
  end
end
