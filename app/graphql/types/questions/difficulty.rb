# frozen_string_literal: true

module Types
  module Questions
    class Difficulty < Types::BaseEnum
      graphql_name "QuestionDifficulty"

      value "easy"
      value "medium"
      value "hard"
    end
  end
end
