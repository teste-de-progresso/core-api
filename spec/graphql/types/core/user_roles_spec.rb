# frozen_string_literal: true

require "rails_helper"

describe Types::Core::UserRoles do
  subject { described_class }

  describe "values" do
    it { expect(described_class.values.keys).to(match(%w[admin teacher nde coordinator center_director pro_rector])) }
  end
end
