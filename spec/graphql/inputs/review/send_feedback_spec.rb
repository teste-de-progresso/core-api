# frozen_string_literal: true

require "rails_helper"

describe Inputs::Review::SendFeedback do
  subject { described_class }

  describe "arguments" do
    it { is_expected.to(accept_argument(:question_id).of_type("ID!")) }
    it { is_expected.to(accept_argument(:status).of_type("FeedbackStatus")) }
    it { is_expected.to(accept_argument(:comment).of_type("String")) }
  end
end
