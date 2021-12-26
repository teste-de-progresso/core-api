# frozen_string_literal: true

require "rails_helper"

describe Types::Questions::Status do
  subject { described_class }

  describe "values" do
    it do
      expect(described_class.values.keys).to(
        match(%w[DRAFT WAITING_REVIEW WITH_REQUESTED_CHANGES APPROVED REGISTERED])
      )
    end
  end
end
