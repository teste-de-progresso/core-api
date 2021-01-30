# frozen_string_literal: true

require 'rails_helper'

describe ProgressTestSchema do
  describe '#my_user' do
    context 'when is authed' do
      it 'return user from context' do
        user = create(:user)

        query = <<~GQL
          query {
            myUser {
              id
              name
              email
              avatarUrl
              roles
            }
          }
        GQL

        expected_result = { data: {
          myUser: {
            id: user.id.to_s,
            name: user.name,
            email: user.email,
            avatarUrl: nil,
            roles: []
          }
        } }.with_indifferent_access

        result = described_class.execute(query, context: { current_user: user })
        expect(result.to_h).to eq(expected_result)
      end
    end

    context 'when is not authed' do
      it 'return empty user' do
        query = <<~GQL
          query {
            myUser {
              id
              name
              email
              avatarUrl
              roles
            }
          }
        GQL

        expected_result = { data: {
          myUser: nil
        } }.with_indifferent_access

        result = described_class.execute(query)
        expect(result.to_h).to eq(expected_result)
      end
    end
  end
end
