# frozen_string_literal: true

module Types
  module Questions
    class ObjectiveCollectionPage < Types::BaseObject
      graphql_name 'ObjectiveCollectionPageType'

      field :nodes, [Types::Questions::Objective], null: true
      field :page_info, Types::PageInfo, null: true
    end

    class ObjectiveCollection < Types::BaseObject
      graphql_name 'ObjectiveCollectionType'

      field :payload, ObjectiveCollectionPage, null: false do
        argument :where, Inputs::Questions::ObjectiveWhere, required: false
        argument :page, Integer, required: true
        argument :limit, Integer, required: true
      end

      def payload(page:, limit:, where: {})
        questions = object.where(where.to_h).page(page).per(limit)

        {
          nodes: questions,
          page_info: questions
        }
      end
    end
  end
end
