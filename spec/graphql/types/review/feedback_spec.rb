# frozen_string_literal: true

require "rails_helper"

describe Types::Review::Feedback do
  subject { described_class }

  describe "fields" do
    it { is_expected.to(have_field(:id).of_type("ID!")) }
    it { is_expected.to(have_field(:status).of_type("FeedbackStatus!")) }
    it { is_expected.to(have_field(:comment).of_type("String")) }
    it { is_expected.to(have_field(:created_at).of_type("ISO8601DateTime!")) }
    it { is_expected.to(have_field(:updated_at).of_type("ISO8601DateTime!")) }
  end
end
