# frozen_string_literal: true

module Sources
  class ActiveRecord < GraphQL::Dataloader::Source
    # rubocop:disable Lint/MissingSuper
    def initialize(model_class)
      @model_class = model_class
    end

    def fetch(ids)
      records = @model_class.where(id: ids).index_by(&:id)
      records.slice(*ids).values
    end
  end
end
