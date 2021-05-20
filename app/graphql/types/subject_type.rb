# frozen_string_literal: true

module Types
  class SubjectType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :axis, AxisType, null: false
    def axis
      dataloader.with(Sources::ActiveRecord, Axis).load(object.axis_id)
    end

    field :category, CategoryType, null: false
    def category
      dataloader.with(Sources::ActiveRecord, Category).load(object.category_id)
    end

    field :questions, QuestionType.connection_type, null: false do
      argument :where, Inputs::QuestionWhereInput, required: false
    end
    def questions(where: nil)
      QuestionPolicy::Scope.new(context[:current_user], object.questions)
        .resolve
        .where(where.to_h)
        .order(updated_at: :desc)
    end
  end
end
