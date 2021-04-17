# frozen_string_literal: true

require "rails_helper"

describe Types::ResponseErrorType do
  subject { described_class }

  describe "fields" do
    it { is_expected.to(have_field(:full_messages).of_type("[String!]!")) }
    it { is_expected.to(have_field(:field_name).of_type("String")) }
    it { is_expected.to(have_field(:messages).of_type("[String!]")) }
    it { is_expected.to(have_field(:path).of_type("[String!]")) }
  end
end
