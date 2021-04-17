# frozen_string_literal: true

require "rails_helper"

describe ProgressTestSchema do
  describe "#subjects" do
    context "when request axis and category nodes" do
      it "return two subjects" do
        user = create(:user, roles: [build(:role, :teacher)])

        subject1 = create(:subject)
        subject2 = create(:subject)

        query = <<~GQL
          query {
            subjects {
              nodes {
                id
                name
                axis {
                  id
                  name
                }
                category {
                  id
                  name
                }
              }
            }
          }
        GQL

        expected_result = { data: {
          subjects: {
            nodes: [
              {
                id: subject1.id.to_s,
                name: subject1.name,
                axis: {
                  id: subject1.axis.id.to_s,
                  name: subject1.axis.name,
                },
                category: {
                  id: subject1.category.id.to_s,
                  name: subject1.category.name,
                },
              },
              {
                id: subject2.id.to_s,
                name: subject2.name,
                axis: {
                  id: subject2.axis.id.to_s,
                  name: subject2.axis.name,
                },
                category: {
                  id: subject2.category.id.to_s,
                  name: subject2.category.name,
                },
              },
            ],
          },
        } }.with_indifferent_access

        result = described_class.execute(query, context: { current_user: user })
        expect(result.to_h).to(eq(expected_result))
      end
    end
  end
end
