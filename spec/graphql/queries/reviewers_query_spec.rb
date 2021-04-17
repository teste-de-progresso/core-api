# frozen_string_literal: true

require 'rails_helper'

describe ProgressTestSchema do
  describe '#reviewers' do
    it 'return users with "teacher" and "nde" roles' do
      user = create(:user, roles: [build(:role, :admin)])

      user1 = create(:user, roles: [build(:role, :nde)])
      user2 = create(:user, roles: [build(:role, :teacher)])

      query = <<~GQL
        query {
          reviewers {
            nodes {
              id
              name
              roles
            }
          }
        }
      GQL

      expected_result = { data: {
        reviewers: {
          nodes: [
            {
              id: user1.id.to_s,
              name: user1.name,
              roles: user1.roles.map(&:name)
            },
            {
              id: user2.id.to_s,
              name: user2.name,
              roles: user2.roles.map(&:name)
            }
          ]
        }
      } }.with_indifferent_access

      result = described_class.execute(query, context: { current_user: user })

      expect(result.to_h).to eq(expected_result)
    end
  end
end
