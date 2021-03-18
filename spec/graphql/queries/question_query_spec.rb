# frozen_string_literal: true

require 'rails_helper'

describe ProgressTestSchema do
  describe '#question' do
    context 'when query question by uuid' do
      let(:context) { { current_user: create(:user) } }

      it 'return question' do
        question = create(:question)

        query = <<~GQL
          query ($uuid: ID!) {
            question(uuid:  $uuid) {
              id
              uuid
              introduction
              instruction
              body
              support
              explanation
              references
              status
              checkType
              difficulty
              bloomTaxonomy
              authorshipYear
              source
              alternatives {
                text
                correct
              }
            }
          }
        GQL

        expected_result = { data: {
          question: {
            id: question.id.to_s,
            uuid: question.uuid,
            introduction: question.introduction,
            instruction: question.instruction,
            body: question.body,
            support: question.support,
            explanation: question.explanation,
            references: question.references,
            status: question.status,
            checkType: question.check_type,
            difficulty: question.difficulty,
            bloomTaxonomy: question.bloom_taxonomy,
            authorshipYear: question.authorship_year,
            source: question.source,
            alternatives: question.alternatives,
          },
        } }.with_indifferent_access

        result = described_class.execute(query, variables: { uuid: question.uuid }, context: context)
        expect(result.to_h).to(eq(expected_result))
      end
    end
  end
end
