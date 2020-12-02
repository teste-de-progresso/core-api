# frozen_string_literal: true

require 'rails_helper'

describe Types::Users::Details do
  subject { described_class }

  describe 'fields' do
    it { is_expected.to have_field(:id).of_type 'ID!' }
    it { is_expected.to have_field(:name).of_type 'String' }
    it { is_expected.to have_field(:email).of_type 'String!' }
    it { is_expected.to have_field(:avatar_url).of_type 'String' }
    it { is_expected.to have_field(:roles).of_type '[Role!]!' }
    it { is_expected.to have_field(:active_review_requests).of_type '[ReviewRequestType!]!' }
  end
end
